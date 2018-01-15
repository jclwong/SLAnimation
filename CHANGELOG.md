All notable changes to this project will be documented in this file.

## [1.4.1] 2018-01-15
### Changed
- ENUMS to use "NSUInteger" instead of "int"

## [1.4] 2017-12-19
### Added
- Added Effects: Fade Down
- Added Effects: Fade Up

## [1.3] 2017-11-25
### Added
- Added Animatable Property: Rotation
- Added CHANGELOG


## [1.2] 2017-10-23
### Added
- Added Effects: Rise
- Added Effects: Fall

### Changed
- Changed effect types from NSValue to NSObject - to hold colors properly

## [1.1] 2017-10-17
### Added
- Hello CocoaPods!


## [1.0] 2017-10-16
### Changed

- Both classes now have generic "setProp" or "setEffect" which uses ENUMS for clarity - instead of separate methods to set each prop.
- Implemented designated initialisers - now every effect has access to the same (full) functionality, ie callbacks, callback objects, etc.
- Refactored: SLAnimation to SLAnim
- Refactored: SLAnimationUtil to SLAnimUtil

## [0.3] 2017-11-25
### Added
- Added Effects: Slide Left
- Added Effects: Slide Right

## [0.2] 2017-11-25
### Added
- Added Effects: Pop
- Added Effects: Bounce Left
- Added Effects: Bounce Right
- Added Effects: Unroll

### Changed
- Changed Shake Effect to default without additional parameters for simplicity. If detailed control required, use SLAnim directly


## [0.1] 2017-5-31
### Added
- Added Animatable Property: Alpha
- Added Animatable Property: Background Color
- Added Animatable Property: Tint Color
- Added Animatable Property: Center
- Added Animatable Property: Frame
- Added Animatable Property: Shadow Opacity
- Added Animatable Property: Transform Scale
- Added Animatable Property: Transform Vertical Scale
- Added Timing curves
- Added Effects: Shake
