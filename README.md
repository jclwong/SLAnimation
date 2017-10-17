# SLAnimation
Simple and powerful animation library built in Objective-C, compatible with Swift.


### Features:
* Numerous animatable properties
* Multi-stage animations
* Callbacks
* Simplified Effects Wrapper

## Installation

SLAnimation is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SLAnimation'
```


# Class: SLAnimUtil
Common effects at your finger tips.

### Effects:
* Shake
* Pop (in/out)
* Slide Left (in/out)
* Slide Right (in/out)
* Bounce Left (in/out)
* Bounce Right (in/out)
* Unroll Down (in/out)

### Usage:
**Effect: Simple**
```objc
[SLAnimUtil animEffect:SLA_EFFECT_SHAKE view:view time:0.5];
```

**Effect: With Delay**
```objc
[SLAnimUtil animEffect:SLA_EFFECT_SHAKE view:view time:0.5 delay:0.5];
```

**Effect: With Delay + Callback**
```objc
[SLAnimUtil animEffect:SLA_EFFECT_SHAKE view:view time:0.5 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
```

### Example:
**Shake**

![Gif](https://raw.githubusercontent.com/jclwong/SLAnimation/master/readme-assets/sl-effects-shake.gif "Shake")

**Pop (In/Out)**

![Gif](https://raw.githubusercontent.com/jclwong/SLAnimation/master/readme-assets/sl-effects-pop-in-out.gif "Pop In/Out")


**Slide Left (In/Out)**

![Gif](https://raw.githubusercontent.com/jclwong/SLAnimation/master/readme-assets/sl-effects-slide-left-in-out.gif "Slide Left In/Out")


**Bounce Left (In/Out) -> i.e. Slide with a slight spring motion**

![Gif](https://raw.githubusercontent.com/jclwong/SLAnimation/master/readme-assets/sl-effects-bounce-left-in-out.gif "Bounce Left In/Out")


**Unroll Down (In/Out)**

![Gif](https://raw.githubusercontent.com/jclwong/SLAnimation/master/readme-assets/sl-effects-unroll-down-in-out.gif "Unroll Down In/Out")



# Class: SLAnim
Core class for advanced usage


### Compulsary
* View
* Time

### Animatable Properties:
* Alpha
* Center
* Color: Background
* Color: Tint
* Frame
* Shadow Opacity
* Transform X, Transform Y, Transform XY

### Optional
* Delay
* Callback (+ Callback Object)


### Usage:
```objc
SLAnimation *anim = [[SLAnimation alloc] init];
// (Set Compulsary)
// (Set Animation Properties)
// (Set Optionals)
[anim animate];
```

#### Use-case: Pop In Effect
* Scale up (slightly larger)
* Scale down (correct size)
```objc
SLAnim *anim = [[SLAnim alloc] initWithView:view];
[anim setTimes:@[@(0.4), @(0.1)]];
[anim setProp:SLA_PROP_TRANSFORM_XY values:@[@0, @1.1, @1]];
[anim animate];
```

#### Use-case[2]: Pulse Alpha
* Fade In
* Fade Out Slow
* Optional: Trigger callbacks
```objc
SLAnimation *anim = [[SLAnimation alloc] initWithView:view];
[anim setTimes:@[@(0.1), @(0.4)]];
[anim setProp:SLA_PROP_ALPHA values:@[@0, @1, @0]];
[anim setCallbackTarget:self callbackSelector:@selector(onAnimateComplete)];
[anim animate];
```


# Author

Jack Wong

# License

SLAnimation is available under the MIT license. See the LICENSE file for more info.
