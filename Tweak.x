#import <dlfcn.h>
#import <UIKit/UIKit.h>
#include <objc/message.h>
#import "FLEXManager.h"

@interface UIWindow (PrivatePrisonFLEX)
@property (nonatomic, strong) UILongPressGestureRecognizer *flexLongPress;
@end

@interface PrisonFLEX : NSObject
@property (nonatomic, assign) BOOL didFirstRun;
+(instancetype)sharedInstance;
-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer;
@end

@implementation PrisonFLEX
+ (instancetype)sharedInstance
{
    static PrisonFLEX *_sharedFactory = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedFactory = [[self alloc] init];
    });

    return _sharedFactory;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        FLEXManager *manager = [FLEXManager sharedManager];
        
        if (manager.isHidden) {
            if(!self.didFirstRun) {
                [manager performSelector:@selector(showExplorer)];
                self.didFirstRun = YES;
            } else {
                [manager performSelector:@selector(toggleExplorer)];
            }
        }
    }
}
@end

static UILongPressGestureRecognizer *RegisterLongPressGesture(UIWindow *window, NSUInteger fingers) {
    UILongPressGestureRecognizer *longPress = nil;
    if (![window isKindOfClass:objc_getClass("FLEXWindow")]) {
        longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:[PrisonFLEX sharedInstance] action:@selector(handleLongPress:)];
        longPress.numberOfTouchesRequired = fingers;
        [window addGestureRecognizer:longPress];
    }
    return longPress;
}

%hook UIWindow
%property (nonatomic, strong) UILongPressGestureRecognizer *flexLongPress;

-(void)becomeKeyWindow {
    %orig();
    if (self.flexLongPress == nil) {
        self.flexLongPress = RegisterLongPressGesture(self, 3);
    }
}

-(void)resignKeyWindow {
    if (self.flexLongPress != nil) {
        [self removeGestureRecognizer:self.flexLongPress];
        self.flexLongPress = nil;
    }
    %orig();
}
%end

%ctor {
    %init();
}
