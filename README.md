# PrisonFLEX
A simple tweak to inject [FLEX](https://github.com/FLEXTool/FLEX) into any application and activate with a three finger long press gesture. Mainly geared towards jailed tweak injection, such as LiveContainer's TweakLoader. Compatible with rootless jailbroken devices as well.

## Features
FLEX and a simple FLEX loader compiled into one package. Activate with a three-finger long press anywhere in the UIWindow of the injected application.

## Installing
Simply inject the .dylib to your tweak loader (ie: LiveContainer) or install the .deb on the application itself via ESign or Sideloadly.

## Building
You may clone the repository and build via theos or use GitHub workflow actions to build. You may specify a custom FLEX repository and branch if you want, the standard repository is the default for building though.

## Credits
* [pwnless](https://github.com/pwnless) for the initial inspiration and core tweak, AutoFLEX. More info [here](https://hope1ess.com/2024/10/09/enhancing-ios-debugging-creating-a-custom-flex-loader-to-any-3rd-party-ios-application/).
* [DGh0st](https://github.com/DGh0st) for the three finger gesture crash-fix.
* [FLEXTool](https://github.com/FLEXTool) for the FLEX itself.
### Honorable Mentions
* [weiminghuaa](https://github.com/weiminghuaa) for his system log fix.
* [otnielyehezkiel](https://github.com/otnielyehezkiel) for his work on SwiftUI support.
