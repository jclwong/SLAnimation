//
//  SLAnimUtil.m
//  StepLearn Education
//
//  Created by Jack Wong on 31/5/17.
//  Copyright © 2017 StepLearn Education. All rights reserved.
//

#import "SLAnimUtil.h"
#import "SLAnim.h"

@implementation SLAnimUtil

#pragma mark - Animations: Single Property

+ (BOOL) animProp:(int)prop animValue:(NSObject *)animValue view:(UIView *)view time:(float)time {
    return [self animProp:prop animValue:animValue view:view time:time delay:0 cbTarget:nil cbSelector:nil cbObject:nil];
}
+ (BOOL) animProp:(int)prop animValue:(NSObject *)animValue view:(UIView *)view time:(float)time delay:(float)delay {
    return [self animProp:prop animValue:animValue view:view time:time delay:delay cbTarget:nil cbSelector:nil cbObject:nil];
}
+ (BOOL) animProp:(int)prop animValue:(NSObject *)animValue view:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    return [self animProp:prop animValue:animValue view:view time:time delay:delay cbTarget:target cbSelector:selector cbObject:nil];
}

+ (BOOL) animProp:(int)prop animValue:(NSObject *)animValue
             view:(UIView *)view time:(float)time delay:(float)delay
         cbTarget:(id)target cbSelector:(SEL)selector cbObject:(id)cbObject {
    SLAnim *anim = [[SLAnim alloc] initWithView:view times:@[@(time)]];
    [anim setDelay:delay];
    [anim setCallbackTarget:target callbackSelector:selector callbackObject:cbObject];
    
    if (prop == SLA_PROP_ALPHA) {
        [anim setProp:SLA_PROP_ALPHA values:@[@(view.alpha), animValue]];

    } else if (prop == SLA_PROP_CENTER) {
        [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:view.center], animValue]];
        
    } else if (prop == SLA_PROP_COLOR_BG) {
        [anim setProp:SLA_PROP_COLOR_BG values:@[view.backgroundColor, animValue]];

    } else if (prop == SLA_PROP_FRAME) {
        [anim setProp:SLA_PROP_FRAME values:@[[NSValue valueWithCGRect:view.frame], animValue]];

    } else if (prop == SLA_PROP_SHADOW_OPACITY) {
        [anim setProp:SLA_PROP_SHADOW_OPACITY values:@[@(view.layer.shadowOpacity), animValue]];
    
    } else if (prop == SLA_PROP_TRANSFORM_X) {
        [anim setProp:SLA_PROP_TRANSFORM_X values:@[@(view.transform.a), animValue]];
        
    } else if (prop == SLA_PROP_TRANSFORM_Y) {
        [anim setProp:SLA_PROP_TRANSFORM_Y values:@[@(view.transform.d), animValue]];
        
    } else if (prop == SLA_PROP_TRANSFORM_XY) {
        [anim setProp:SLA_PROP_TRANSFORM_XY values:@[@(view.transform.a), animValue]];   // a(x) == d(y)
    }
    return [anim animate];
}


#pragma mark - Animation: Effects

+ (BOOL) animEffect:(int)effect view:(UIView *)view time:(float)time {
    return [self animEffect:effect view:view time:time delay:0 cbTarget:nil cbSelector:nil cbObject:nil];
}
+ (BOOL) animEffect:(int)effect view:(UIView *)view time:(float)time delay:(float)delay {
    return [self animEffect:effect view:view time:time delay:delay cbTarget:nil cbSelector:nil cbObject:nil];
}
+ (BOOL) animEffect:(int)effect view:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector {
    return [self animEffect:effect view:view time:time delay:delay cbTarget:target cbSelector:selector cbObject:nil];
}
+ (BOOL) animEffect:(int)effect view:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector cbObject:(id)cbObject {
    SLAnim *anim = [[SLAnim alloc] initWithView:view];
    [anim setDelay:delay];
    [anim setCallbackTarget:target callbackSelector:selector callbackObject:cbObject];
    
    if (effect == SLA_EFFECT_BOUNCE_LEFT_IN) {
        [self bounceLeftIn:anim view:view time:time];
    } else if (effect == SLA_EFFECT_BOUNCE_LEFT_OUT) {
        [self bounceLeftOut:anim view:view time:time];
        
    } else if (effect == SLA_EFFECT_BOUNCE_RIGHT_IN) {
        [self bounceRightIn:anim view:view time:time];
    } else if (effect == SLA_EFFECT_BOUNCE_RIGHT_OUT) {
        [self bounceRightOut:anim view:view time:time];

    } else if (effect == SLA_EFFECT_POP_IN) {
        [self popIn:anim view:view time:time];
    } else if (effect == SLA_EFFECT_POP_OUT) {
        [self popOut:anim view:view time:time];

    } else if (effect == SLA_EFFECT_RISE_IN) {
        [self riseIn:anim view:view time:time];
    } else if (effect == SLA_EFFECT_RISE_OUT) {
        [self riseOut:anim view:view time:time];
    
    } else if (effect == SLA_EFFECT_FALL_IN) {
        [self fallIn:anim view:view time:time];
    } else if (effect == SLA_EFFECT_FALL_OUT) {
        [self fallOut:anim view:view time:time];

    } else if (effect == SLA_EFFECT_SHAKE) {
        [self shake:anim view:view time:time];

    } else if (effect == SLA_EFFECT_SLIDE_LEFT_IN) {
        [self slideLeftIn:anim view:view time:time];
    } else if (effect == SLA_EFFECT_SLIDE_LEFT_OUT) {
        [self slideLeftOut:anim view:view time:time];

    } else if (effect == SLA_EFFECT_SLIDE_RIGHT_IN) {
        [self slideRightIn:anim view:view time:time];
    } else if (effect == SLA_EFFECT_SLIDE_RIGHT_OUT) {
        [self slideRightOut:anim view:view time:time];

    } else if (effect == SLA_EFFECT_UNROLL_DOWN_IN) {
        [self unrollDownIn:anim view:view time:time];
    } else if (effect == SLA_EFFECT_UNROLL_DOWN_OUT) {
        [self unrollDownOut:anim view:view time:time];
    }
    return [anim animate];
}


#pragma mark - Shake

+ (SLAnim *) shake:(SLAnim *)anim view:(UIView *)view time:(float)time {
    [anim setTimes:@[@(time*0.2), @(time*0.2), @(time*0.2), @(time*0.2), @(time*0.2)]];
    [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:view.center],
                                           [NSValue valueWithCGPoint:CGPointMake(view.center.x-15, view.center.y)],
                                           [NSValue valueWithCGPoint:CGPointMake(view.center.x+15, view.center.y)],
                                           [NSValue valueWithCGPoint:CGPointMake(view.center.x-10, view.center.y)],
                                           [NSValue valueWithCGPoint:CGPointMake(view.center.x+5, view.center.y)],
                                           [NSValue valueWithCGPoint:view.center]]];
    return anim;
}

#pragma mark - Pop

+ (SLAnim *) popIn:(SLAnim *)anim view:(UIView *)view time:(float)time {
    [anim setTimes:@[@(time*0.8), @(time*0.2)]];
    [anim setProp:SLA_PROP_ALPHA values:@[@0, @1, @1]];
    [anim setProp:SLA_PROP_TRANSFORM_XY values:@[@0.3, @1.1, @1]];
    return anim;
}

+ (SLAnim *) popOut:(SLAnim *)anim view:(UIView *)view time:(float)time {
    [anim setTimes:@[@(time*0.2), @(time*0.8)]];
    [anim setProp:SLA_PROP_ALPHA values:@[@1, @1, @0]];
    [anim setProp:SLA_PROP_TRANSFORM_XY values:@[@1, @1.1, @0.3]];
    return anim;
}

#pragma mark - Rise

+ (SLAnim *) riseIn:(SLAnim *)anim view:(UIView *)view time:(float)time {
    [anim setTimes:@[@(time)]];
    [anim setProp:SLA_PROP_ALPHA values:@[@0, @1]];
    [anim setProp:SLA_PROP_TRANSFORM_XY values:@[@0.3, @1]];
    return anim;
}

+ (SLAnim *) riseOut:(SLAnim *)anim view:(UIView *)view time:(float)time {
    [anim setTimes:@[@(time)]];
    [anim setProp:SLA_PROP_ALPHA values:@[@1, @0]];
    [anim setProp:SLA_PROP_TRANSFORM_XY values:@[@1, @1.7]];
    return anim;
}

#pragma mark - Fall

+ (SLAnim *) fallIn:(SLAnim *)anim view:(UIView *)view time:(float)time {
    [anim setTimes:@[@(time)]];
    [anim setProp:SLA_PROP_ALPHA values:@[@0, @1]];
    [anim setProp:SLA_PROP_TRANSFORM_XY values:@[@1.7, @1]];
    return anim;
}

+ (SLAnim *) fallOut:(SLAnim *)anim view:(UIView *)view time:(float)time {
    [anim setTimes:@[@(time)]];
    [anim setProp:SLA_PROP_ALPHA values:@[@1, @0]];
    [anim setProp:SLA_PROP_TRANSFORM_XY values:@[@1, @0.3]];
    return anim;
}

#pragma mark - Slide Left

+ (SLAnim *) slideLeftIn:(SLAnim *)anim view:(UIView *)view time:(float)time {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    [anim setTimes:@[@(time)]];
    [anim setAnimationOption:SLA_TIME_EASE_IN];
    [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:CGPointMake(view.center.x+sWidth, view.center.y)], [NSValue valueWithCGPoint:view.center]]];
    [anim setProp:SLA_PROP_ALPHA values:@[@0, @1]];
    return anim;
}

+ (SLAnim *) slideLeftOut:(SLAnim *)anim view:(UIView *)view time:(float)time {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    [anim setTimes:@[@(time)]];
    [anim setAnimationOption:SLA_TIME_EASE_OUT];
    [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:view.center], [NSValue valueWithCGPoint:CGPointMake(view.center.x - sWidth, view.center.y)]]];
    [anim setProp:SLA_PROP_ALPHA values:@[@1, @0]];
    return anim;
}

#pragma mark - Slide Right


+ (SLAnim *) slideRightIn:(SLAnim *)anim view:(UIView *)view time:(float)time {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    [anim setTimes:@[@(time)]];
    [anim setAnimationOption:SLA_TIME_EASE_IN];
    [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:CGPointMake(view.center.x-sWidth, view.center.y)],
     [NSValue valueWithCGPoint:view.center]]];
    [anim setProp:SLA_PROP_ALPHA values:@[@0, @1]];
    return anim;
}

+ (SLAnim *) slideRightOut:(SLAnim *)anim view:(UIView *)view time:(float)time {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    [anim setTimes:@[@(time)]];
    [anim setAnimationOption:SLA_TIME_EASE_OUT];
    [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:view.center],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x+sWidth, view.center.y)]]];
    [anim setProp:SLA_PROP_ALPHA values:@[@1, @0]];
    return anim;
}

#pragma mark - Bounce Left

+ (SLAnim *) bounceLeftIn:(SLAnim *)anim view:(UIView *)view time:(float)time {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    [anim setTimes:@[@(time*0.8), @(time*0.2)]];
    [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:CGPointMake(view.center.x+sWidth, view.center.y)],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x-20, view.center.y)],
     [NSValue valueWithCGPoint:view.center]]];
    [anim setProp:SLA_PROP_ALPHA values:@[@0, @1, @1]];
    return anim;
}

+ (SLAnim *) bounceLeftOut:(SLAnim *)anim view:(UIView *)view time:(float)time {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    [anim setTimes:@[@(time*0.2), @(time*0.8)]];
    [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:view.center],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x+20, view.center.y)],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x-sWidth, view.center.y)]]];
    [anim setProp:SLA_PROP_ALPHA values:@[@1, @1, @0]];
    return anim;
}

#pragma mark - Bounce Right

+ (SLAnim *) bounceRightIn:(SLAnim *)anim view:(UIView *)view time:(float)time {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    [anim setTimes:@[@(time*0.8), @(time*0.2)]];
    [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:CGPointMake(view.center.x-sWidth, view.center.y)],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x+20, view.center.y)],
     [NSValue valueWithCGPoint:view.center]]];
    [anim setProp:SLA_PROP_ALPHA values:@[@0, @1, @1]];
    return anim;
}

+ (SLAnim *) bounceRightOut:(SLAnim *)anim view:(UIView *)view time:(float)time {
    float sWidth = [UIScreen mainScreen].bounds.size.width;
    [anim setTimes:@[@(time*0.2), @(time*0.8)]];
    [anim setProp:SLA_PROP_CENTER values:@[[NSValue valueWithCGPoint:view.center],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x-20, view.center.y)],
     [NSValue valueWithCGPoint:CGPointMake(view.center.x+sWidth, view.center.y)]]];
    [anim setProp:SLA_PROP_ALPHA values:@[@1, @1, @0]];
    return anim;
}

#pragma mark - Unroll Down

+ (SLAnim *) unrollDownIn:(SLAnim *)anim view:(UIView *)view time:(float)time {
    CGRect f = view.frame;
    [anim setTimes:@[@(time*0.8), @(time*0.2)]];
    [anim setProp:SLA_PROP_ALPHA values:@[@0, @1, @1]];
    [anim setProp:SLA_PROP_FRAME values: @[[NSValue valueWithCGRect:CGRectMake(f.origin.x, f.origin.y, f.size.width, 0)],
                     [NSValue valueWithCGRect:CGRectMake(f.origin.x, f.origin.y, f.size.width, f.size.height + f.size.height * 0.05)],
                     [NSValue valueWithCGRect:f]]];
    return anim;
}

+ (SLAnim *) unrollDownOut:(SLAnim *)anim view:(UIView *)view time:(float)time {
    CGRect f = view.frame;
    [anim setTimes:@[@(time*0.2), @(time*0.8)]];
    [anim setProp:SLA_PROP_ALPHA values:@[@1, @1, @0]];
    [anim setProp:SLA_PROP_FRAME values: @[[NSValue valueWithCGRect:f],
                     [NSValue valueWithCGRect:CGRectMake(f.origin.x, f.origin.y, f.size.width, f.size.height + f.size.height * 0.05)],
                     [NSValue valueWithCGRect:CGRectMake(f.origin.x, f.origin.y, f.size.width, 0)]]];
    return anim;
}


@end
