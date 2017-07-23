//
//  SLAnimationUtil.m
//  StepLearn Education
//
//  Created by Jack Wong on 31/5/17.
//  Copyright © 2017 StepLearn Education. All rights reserved.
//

#import "SLAnimationUtil.h"
#import "SLAnimation.h"

@implementation SLAnimationUtil

#pragma mark - Shorthand Methods

+ (BOOL) animateBgColor:(UIColor *)color view:(UIView *)view time:(float)time {
    return [self animateBgColor:color view:view time:time callbackTarget:nil callbackSelector:nil];
}

+ (BOOL) animateTintColor:(UIColor *)color view:(UIView *)view time:(float)time {
    return [self animateTintColor:color view:view time:time callbackTarget:nil callbackSelector:nil];
}

+ (BOOL) animateFrame:(CGRect)frame view:(UIView *)view time:(float)time {
    return [self animateFrame:frame view:view time:time callbackTarget:nil callbackSelector:nil];
}

+ (BOOL) animateCenter:(CGPoint)center view:(UIView *)view time:(float)time {
    return [self animateCenter:center view:view time:time callbackTarget:nil callbackSelector:nil];
}
+ (BOOL) animateAlpha:(float)alpha view:(UIView *)view time:(float)time {
    return [self animateAlpha:alpha view:view time:time callbackTarget:nil callbackSelector:nil];
}

+ (BOOL) animateBgColor:(UIColor *)color
                   view:(UIView *)view time:(float)time
         callbackTarget:(id)target callbackSelector:(SEL)sel {
    SLAnimation *anim = [[SLAnimation alloc] initWithView:view times:[NSNumber numberWithFloat:time], nil];
    [anim setBgColors:view.backgroundColor, color, nil];
    [anim setCallbackTarget:target callbackSelector:sel];
    return [anim animate];
}

+ (BOOL) animateTintColor:(UIColor *)color
                     view:(UIView *)view time:(float)time
           callbackTarget:(id)target callbackSelector:(SEL)sel {
    SLAnimation *anim = [[SLAnimation alloc] initWithView:view times:[NSNumber numberWithFloat:time], nil];
    [anim setTintColors:view.tintColor, color, nil];
    [anim setCallbackTarget:target callbackSelector:sel];
    return [anim animate];
}

+ (BOOL) animateFrame:(CGRect)frame
                 view:(UIView *)view time:(float)time
       callbackTarget:(id)target callbackSelector:(SEL)sel {
    SLAnimation *anim = [[SLAnimation alloc] initWithView:view times:[NSNumber numberWithFloat:time], nil];
    [anim setFrames:[NSValue valueWithCGRect:view.frame], [NSValue valueWithCGRect:frame], nil];
    [anim setCallbackTarget:target callbackSelector:sel];
    return [anim animate];
}

+ (BOOL) animateCenter:(CGPoint)center
                  view:(UIView *)view time:(float)time
        callbackTarget:(id)target callbackSelector:(SEL)sel {
    SLAnimation *anim = [[SLAnimation alloc] initWithView:view times:[NSNumber numberWithFloat:time], nil];
    [anim setCenters:[NSValue valueWithCGPoint:view.center], [NSValue valueWithCGPoint:center], nil];
    [anim setCallbackTarget:target callbackSelector:sel];
    return [anim animate];
}

+ (BOOL) animateAlpha:(float)alpha
                 view:(UIView *)view time:(float)time
       callbackTarget:(id)target callbackSelector:(SEL)sel {
    SLAnimation *anim = [[SLAnimation alloc] initWithView:view times:[NSNumber numberWithFloat:time], nil];
    [anim setAlphas:@(view.alpha), @(alpha), nil];
    [anim setCallbackTarget:target callbackSelector:sel];
    return [anim animate];
}

+ (BOOL) animateAlpha:(float)alpha
                 view:(UIView *)view time:(float)time
       callbackTarget:(id)target callbackSelector:(SEL)sel callbackObject:(id)object {
    SLAnimation *anim = [[SLAnimation alloc] initWithView:view times:[NSNumber numberWithFloat:time], nil];
    [anim setAlphas:@(view.alpha), @(alpha), nil];
    [anim setCallbackTarget:target callbackSelector:sel callbackObject:object];
    return [anim animate];
}


#pragma mark - Shake

+ (BOOL) shakeWithView:(UIView *)view time:(float)time {
    return [self shakeWithView:view time:time delay:0 cbTarget:nil cbSelector:nil];
}
+ (BOOL) shakeWithView:(UIView *)view time:(float)time delay:(float)delay {
    return [self shakeWithView:view time:time delay:delay cbTarget:nil cbSelector:nil];
}
+ (BOOL) shakeWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    SLAnimation *anim = [self animatorWithView:view delay:delay cbTarget:target cbSelector:selector];
    [anim setTimes:@(time*0.2), @(time*0.2), @(time*0.2), @(time*0.2), @(time*0.2), nil];
    [anim setCenters:[NSValue valueWithCGPoint:view.center],
                     [NSValue valueWithCGPoint:CGPointMake(view.center.x-15, view.center.y)],
                     [NSValue valueWithCGPoint:CGPointMake(view.center.x+15, view.center.y)],
                     [NSValue valueWithCGPoint:CGPointMake(view.center.x-10, view.center.y)],
                     [NSValue valueWithCGPoint:CGPointMake(view.center.x+5, view.center.y)],
                     [NSValue valueWithCGPoint:view.center], nil];
    return [anim animate];
}

#pragma mark - Pop

+ (BOOL) popInWithView:(UIView *)view time:(float)time {
    return [self popInWithView:view time:time delay:0 cbTarget:nil cbSelector:nil];
}
+ (BOOL) popInWithView:(UIView *)view time:(float)time delay:(float)delay {
    return [self popInWithView:view time:time delay:delay cbTarget:nil cbSelector:nil];
}
+ (BOOL) popInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    SLAnimation *anim = [self animatorWithView:view delay:delay cbTarget:target cbSelector:selector];
    [anim setTimes:@(time*0.8), @(time*0.2), nil];
    [anim setAlphas:@0, @1, @1, nil];
    [anim setTransformScale:@0.3, @1.1, @1, nil];
    return [anim animate];
}

+ (BOOL) popOutWithView:(UIView *)view time:(float)time {
    return [self popOutWithView:view time:time delay:0 cbTarget:nil cbSelector:nil];
}
+ (BOOL) popOutWithView:(UIView *)view time:(float)time delay:(float)delay {
    return [self popOutWithView:view time:time delay:delay cbTarget:nil cbSelector:nil];
}
+ (BOOL) popOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    SLAnimation *anim = [self animatorWithView:view delay:delay cbTarget:target cbSelector:selector];
    [anim setTimes:@(time*0.2), @(time*0.8), nil];
    [anim setAlphas:@1, @1, @0, nil];
    [anim setTransformScale:@1, @1.1, @0.3, nil];
    return [anim animate];
}


#pragma mark - Bounce Left

+ (BOOL) bounceLeftInWithView:(UIView *)view time:(float)time {
    return [self bounceLeftInWithView:view time:time delay:0 cbTarget:nil cbSelector:nil];
}
+ (BOOL) bounceLeftInWithView:(UIView *)view time:(float)time delay:(float)delay {
    return [self bounceLeftInWithView:view time:time delay:delay cbTarget:nil cbSelector:nil];
}
+ (BOOL) bounceLeftInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    SLAnimation *anim = [self animatorWithView:view delay:delay cbTarget:target cbSelector:selector];
    [anim setTimes:@(time*0.8), @(time*0.2), nil];
    [anim setAnimationOption:SLAEaseIn];
    [anim setCenters:[NSValue valueWithCGPoint:CGPointMake(view.center.x+sWidth, view.center.y)],
                     [NSValue valueWithCGPoint:CGPointMake(view.center.x-20, view.center.y)],
                     [NSValue valueWithCGPoint:view.center], nil];
    [anim setAlphas:@0, @1, @1, nil];
    return [anim animate];
}

+ (BOOL) bounceLeftOutWithView:(UIView *)view time:(float)time {
    return [self bounceLeftOutWithView:view time:time delay:0 cbTarget:nil cbSelector:nil];
}
+ (BOOL) bounceLeftOutWithView:(UIView *)view time:(float)time delay:(float)delay {
    return [self bounceLeftOutWithView:view time:time delay:delay cbTarget:nil cbSelector:nil];
}
+ (BOOL) bounceLeftOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    SLAnimation *anim = [self animatorWithView:view delay:delay cbTarget:target cbSelector:selector];
    [anim setTimes:@(time*0.2), @(time*0.8), nil];
    [anim setAnimationOption:SLAEaseOut];
    [anim setCenters:[NSValue valueWithCGPoint:view.center],
                     [NSValue valueWithCGPoint:CGPointMake(view.center.x+20, view.center.y)],
                     [NSValue valueWithCGPoint:CGPointMake(view.center.x-sWidth, view.center.y)], nil];
    [anim setAlphas:@1, @1, @0, nil];
    return [anim animate];
}

#pragma mark - Bounce Right

+ (BOOL) bounceRightInWithView:(UIView *)view time:(float)time {
    return [self bounceRightInWithView:view time:time delay:0 cbTarget:nil cbSelector:nil];
}
+ (BOOL) bounceRightInWithView:(UIView *)view time:(float)time delay:(float)delay {
    return [self bounceRightInWithView:view time:time delay:delay cbTarget:nil cbSelector:nil];
}
+ (BOOL) bounceRightInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    SLAnimation *anim = [self animatorWithView:view delay:delay cbTarget:target cbSelector:selector];
    [anim setTimes:@(time*0.8), @(time*0.2), nil];
    [anim setAnimationOption:SLAEaseIn];
    [anim setCenters:[NSValue valueWithCGPoint:CGPointMake(view.center.x-sWidth, view.center.y)],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x+20, view.center.y)],
     [NSValue valueWithCGPoint:view.center], nil];
    [anim setAlphas:@0, @1, @1, nil];
    return [anim animate];
}

+ (BOOL) bounceRightOutWithView:(UIView *)view time:(float)time {
    return [self bounceRightOutWithView:view time:time delay:0 cbTarget:nil cbSelector:nil];
}
+ (BOOL) bounceRightOutWithView:(UIView *)view time:(float)time delay:(float)delay {
    return [self bounceRightOutWithView:view time:time delay:delay cbTarget:nil cbSelector:nil];
}
+ (BOOL) bounceRightOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    SLAnimation *anim = [self animatorWithView:view delay:delay cbTarget:target cbSelector:selector];
    [anim setTimes:@(time*0.2), @(time*0.8), nil];
    [anim setAnimationOption:SLAEaseOut];
    [anim setCenters:[NSValue valueWithCGPoint:view.center],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x-20, view.center.y)],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x+sWidth, view.center.y)], nil];
    [anim setAlphas:@1, @1, @0, nil];
    return [anim animate];
}

#pragma mark - Unroll Down

+ (BOOL) unrollDownInWithView:(UIView *)view time:(float)time {
    return [self unrollDownInWithView:view time:time delay:0 cbTarget:nil cbSelector:nil];
}
+ (BOOL) unrollDownInWithView:(UIView *)view time:(float)time delay:(float)delay {
    return [self unrollDownInWithView:view time:time delay:delay cbTarget:nil cbSelector:nil];
}
+ (BOOL) unrollDownInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    CGRect f = view.frame;
    SLAnimation *anim = [self animatorWithView:view delay:delay cbTarget:target cbSelector:selector];
    [anim setTimes:@(time*0.8), @(time*0.2), nil];
    [anim setAlphas:@0, @1, @1, nil];
    [anim setFrames: [NSValue valueWithCGRect:CGRectMake(f.origin.x, f.origin.y, f.size.width, 0)],
                     [NSValue valueWithCGRect:CGRectMake(f.origin.x, f.origin.y, f.size.width, f.size.height+f.size.height*0.05)],
                     [NSValue valueWithCGRect:f], nil];
    return [anim animate];
}
+ (BOOL) unrollDownOutWithView:(UIView *)view time:(float)time {
    return [self unrollDownOutWithView:view time:time delay:0 cbTarget:nil cbSelector:nil];
}
+ (BOOL) unrollDownOutWithView:(UIView *)view time:(float)time delay:(float)delay {
    return [self unrollDownOutWithView:view time:time delay:delay cbTarget:nil cbSelector:nil];
}
+ (BOOL) unrollDownOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    CGRect f = view.frame;
    SLAnimation *anim = [self animatorWithView:view delay:delay cbTarget:target cbSelector:selector];
    [anim setTimes:@(time*0.2), @(time*0.8), nil];
    [anim setAlphas:@1, @1, @0, nil];
    [anim setFrames: [NSValue valueWithCGRect:f],
                     [NSValue valueWithCGRect:CGRectMake(f.origin.x, f.origin.y, f.size.width, f.size.height+f.size.height*0.05)],
                     [NSValue valueWithCGRect:CGRectMake(f.origin.x, f.origin.y, f.size.width, 0)], nil];
    return [anim animate];
}



#pragma mark - Default (boilerplate)

+ (SLAnimation *) animatorWithView:(UIView *)view delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    SLAnimation *anim = [[SLAnimation alloc] initWithView:view];
    [anim setDelay:delay];
    if (target && selector)
        [anim setCallbackTarget:target callbackSelector:selector];
    return anim;
}


@end
