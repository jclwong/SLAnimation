# SLAnimation
Simple and dynamic iOS animation library (Obj-C)

## Features:
* Multi-stage animations
* Callbacks
* Fully customizable properties
* Clean shorthand abstractions

## Usage:
```objc
SLAnimation *anim = [[SLAnimation alloc] init];
// (set properties)
[anim animate];
```

#### Use-case[1]: View to
* Animate transparency
```objc
SLAnimation *anim = [[SLAnimation alloc] initWithView:view];
[anim setTimes:@(animationTime), nil];
[anim setAlphas:@0, @1, nil];
[anim animate];
```
* Shorthand
```objc
[SLAnimationUtil animateAlpha:1 view:view time:animationTime];
```

#### Use-case[2]: View to
* appear from center (of view frame)
* gain transparency
* bounce effect
* trigger callbacks
```objc
SLAnimation *anim = [[SLAnimation alloc] initWithView:view];
[anim setTimes:@(animationTime * 0.85), @(animationTime * 0.15), nil];
[anim setTransformScale:@0, @1.1, @1, nil];
[anim setAlphas:@0, @1, @1, nil];
[anim setCallbackTarget:callbackTarget callbackSelector:callbackSelector];
[anim animate];
```
