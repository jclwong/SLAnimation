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

+ (BOOL) animateShakeDistance:(float)dist   view:(UIView *)view time:(float)time callbackTarget:(id)target callbackSelector:(SEL)sel {
    float cX = view.center.x;
    float cY = view.center.y;
    float shakeStepTime = time/7;
    
    SLAnimation *anim = [[SLAnimation alloc] initWithView:view];
    [anim setTimes:@(shakeStepTime), @(shakeStepTime), @(shakeStepTime), @(shakeStepTime), @(shakeStepTime), @(shakeStepTime), nil];
    [anim setCenters:[NSValue valueWithCGPoint:CGPointMake(cX-dist, cY)], [NSValue valueWithCGPoint:CGPointMake(cX+dist, cY)], [NSValue valueWithCGPoint:CGPointMake(cX-dist/2, cY)], [NSValue valueWithCGPoint:CGPointMake(cX+dist/2, cY)], [NSValue valueWithCGPoint:CGPointMake(cX-dist/4, cY)], [NSValue valueWithCGPoint:CGPointMake(cX+dist/4, cY)], [NSValue valueWithCGPoint:CGPointMake(cX, cY)], nil];
    [anim setCallbackTarget:target callbackSelector:sel];
    return [anim animate];
}


@end
