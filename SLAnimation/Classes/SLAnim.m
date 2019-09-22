//
//  SLAnim.m
//  StepLearn Education
//
//  Created by Jack Wong on 17/08/2016.
//  Copyright © 2016 StepLearn Education. All rights reserved.
//


#import <QuartzCore/CAAnimation.h>
#import "SLAnim.h"

#define LOG_D [NSString stringWithFormat:@"[Line %3d] %s ", __LINE__, __PRETTY_FUNCTION__]

@interface SLAnim () {
    UIView *_view;
    NSArray *_times;
    
    NSMutableArray *_properties;

    float _delay;
    UIViewAnimationOptions _animationOption;
    id _callbackTarget;
    SEL _callbackSelector;
    id _callbackObject;
    
    int _currentAnimationStep;
    BOOL _isAnimating;
}
@end

@implementation SLAnim

#pragma mark - Init

- (id) init {
    return [self initWithView:nil];
}

- (id) initWithView:(UIView *)view {
    return [self initWithView:view times:nil];
}
- (id) initWithView:(UIView *)view times:(NSArray *)times {
    self = [super init];
    _view = view;
    _isAnimating = NO;
    _properties = [NSMutableArray new];
    _delay = 0;
    _animationOption = UIViewAnimationOptionCurveLinear;
    _times = times;
    for (int index = 0; index < SLA_PROP_COUNT; index++)
        [_properties addObject:[NSNull null]];
    return self;
}


#pragma mark - Property settings

- (void) setView:(UIView *)view {
    _view = view;
}
- (void)setTimes:(NSArray *)times {
    _times = times;
}

- (void)setProp:(NSUInteger)prop values:(NSArray *)values {
    switch (prop) {
        case SLA_PROP_ALPHA:
            [_properties replaceObjectAtIndex:SLA_PROP_ALPHA withObject: values];
            break;
            
        case SLA_PROP_CENTER:
            [_properties replaceObjectAtIndex:SLA_PROP_CENTER withObject:values];
            break;

        case SLA_PROP_COLOR_BG:
            [_properties replaceObjectAtIndex:SLA_PROP_COLOR_BG withObject:values];
            break;

        case SLA_PROP_FRAME:
            [_properties replaceObjectAtIndex:SLA_PROP_FRAME withObject:values];
            break;

        case SLA_PROP_SHADOW_OPACITY:
            [_properties replaceObjectAtIndex:SLA_PROP_SHADOW_OPACITY withObject:values];
            break;

        case SLA_PROP_TRANSFORM_XY:
            [_properties replaceObjectAtIndex:SLA_PROP_TRANSFORM_XY withObject:values];
            break;

        case SLA_PROP_TRANSFORM_X:
            [_properties replaceObjectAtIndex:SLA_PROP_TRANSFORM_X withObject:values];
            break;

        case SLA_PROP_TRANSFORM_Y:
            [_properties replaceObjectAtIndex:SLA_PROP_TRANSFORM_Y withObject:values];
            break;

        case SLA_PROP_ROTATE:
            [_properties replaceObjectAtIndex:SLA_PROP_ROTATE withObject:values];
            break;

        default:
            break;
    }
}
- (void) setDelay:(float)aDelay {
    _delay = aDelay;
}
- (void) setAnimationOption:(NSUInteger)option {
    switch (option) {
        case SLA_TIME_LINEAR:
            _animationOption = UIViewAnimationOptionCurveLinear;
            break;
        case SLA_TIME_EASE_IN:
            _animationOption = UIViewAnimationOptionCurveEaseIn;
            break;
        case SLA_TIME_EASE_OUT:
            _animationOption = UIViewAnimationOptionCurveEaseOut;
            break;
        case SLA_TIME_EASE_IN_OUT:
            _animationOption = UIViewAnimationOptionCurveEaseInOut;
            break;
        default:
            break;
    }
}
- (void) setCallbackTarget:(id)callbackTarget callbackSelector:(SEL)callbackSelector {
    [self setCallbackTarget:callbackTarget callbackSelector:callbackSelector callbackObject:nil];
}
- (void) setCallbackTarget:(id)callbackTarget callbackSelector:(SEL)callbackSelector callbackObject:(id)callbackObject {
    _callbackTarget = callbackTarget;
    _callbackSelector = callbackSelector;
    _callbackObject = callbackObject;
}

#pragma mark - Animation

- (BOOL) animate {
    
    if (![self canAnimate])
        return NO;
    
    _isAnimating = YES;
    _currentAnimationStep = 0;
    [self animateViewWithPropsAtStep:_currentAnimationStep];
    
    if (_delay == 0) {
        [self animationStep];
    } else {
        [self performSelector:@selector(animationStep) withObject:nil afterDelay:_delay];
    }

    return YES;
}

- (void) animationStep {
    [UIView animateWithDuration:[[_times objectAtIndex:_currentAnimationStep] doubleValue] delay:0
                        options:(_animationOption | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [self animateViewWithPropsAtStep:self->_currentAnimationStep + 1];
                     } completion: ^(BOOL finished) {
                         self->_currentAnimationStep++;
                         
                         if (self->_currentAnimationStep < [self->_times count]) {
                             [self animationStep];
                             
                         } else {
                             [self completionCallBack];
                         }
                     }];
}

- (void) animateViewWithPropsAtStep:(int)step {
    for (int index = 0; index < [_properties count]; index++)
        if (![[_properties objectAtIndex:index] isEqual:[NSNull null]])
            [self setViewWithProps:index step:step];
}

- (void) setViewWithProps:(int)property step:(int)step {
    if (property == SLA_PROP_ALPHA)
        [_view setAlpha:[[[_properties objectAtIndex:property] objectAtIndex:step] doubleValue]];
    
    if (property == SLA_PROP_COLOR_BG)
        [_view setBackgroundColor:[[_properties objectAtIndex:property] objectAtIndex:step]];
    
    if (property == SLA_PROP_CENTER)
        [_view setCenter:[[[_properties objectAtIndex:property] objectAtIndex:step] CGPointValue]];
    
    if (property == SLA_PROP_FRAME)
        [_view setFrame:[[[_properties objectAtIndex:property] objectAtIndex:step] CGRectValue]];
    
    if (property == SLA_PROP_SHADOW_OPACITY && step != 0)
        [self setViewShadowOpacityFrom:[[_properties objectAtIndex:property] objectAtIndex:step-1]
                                    to:[[_properties objectAtIndex:property] objectAtIndex:step]
                              duration:[[_times objectAtIndex:step-1] floatValue]];
    
    if (property == SLA_PROP_TRANSFORM_XY) {
        [_view setTransform:CGAffineTransformIdentity];
        [_view setTransform:CGAffineTransformMakeScale([[[_properties objectAtIndex:property] objectAtIndex:step] doubleValue]+0.0001,      // iOS Glitch
                                                       [[[_properties objectAtIndex:property] objectAtIndex:step] doubleValue]+0.0001)];    // Exactly 0 be cannot animated
    }
    
    if (property == SLA_PROP_TRANSFORM_Y) {
        [_view setTransform:CGAffineTransformIdentity];
        [_view setTransform:CGAffineTransformMakeScale(1, [[[_properties objectAtIndex:property] objectAtIndex:step] doubleValue]+0.0001)];
    }
    if (property == SLA_PROP_TRANSFORM_X) {
        [_view setTransform:CGAffineTransformIdentity];
        [_view setTransform:CGAffineTransformMakeScale([[[_properties objectAtIndex:property] objectAtIndex:step] doubleValue]+0.0001, 1)];
    }
    
    if (property == SLA_PROP_ROTATE && step != 0) {
        [self setViewRotation:[[_properties objectAtIndex:property] objectAtIndex:step] duration:[[_times objectAtIndex:step-1] floatValue]];
    }

}

- (void) setViewShadowOpacityFrom:(NSValue *)from to:(NSValue *)to duration:(float)duration {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    anim.fromValue = from;
    anim.toValue = to;
    anim.duration = duration;
    [_view.layer addAnimation:anim forKey:@"shadowOpacity"];
}
- (void) setViewRotation:(NSValue *)value duration:(float)duration {
    CALayer *currentLayer = (CALayer *)[_view.layer presentationLayer];
    NSValue *from = (NSNumber *)[currentLayer valueForKeyPath:@"transform.rotation.z"];

    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.fromValue = from;
    anim.toValue = value;
    anim.duration = duration;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.timingFunction = [self viewAnimationCurveToCoreAnimationTiming:_animationOption];
    [_view.layer addAnimation:anim forKey:@"rotation"];
}


- (BOOL) canAnimate {
    if (_isAnimating) {
        [self log:@"%@ Already animating"];
        return NO;
    }
    
    if (!_view) {
        [self log:@"%@ View must be set", LOG_D];
        return NO;
    }
    if (!_times || [_times count] == 0) {
        [self log:@"%@ Animation times must be set", LOG_D];
        return NO;
    }
    
    if (_delay < 0) {
        [self log:@"%@ Cannot have negative delay", LOG_D];
        return NO;
    }
    
    // Every other property must have 1 more argument than time
    BOOL hasProp = NO;
    for (int index = 0; index < [_properties count]; index++) {
        if (![[_properties objectAtIndex:index] isEqual:[NSNull null]]) {
            hasProp = YES;
            if ([[_properties objectAtIndex:index] count] != [_times count] + 1) {
                [self log:@"%@ Invalid number of %@(s). Have [%d], needs [%d]", LOG_D, [self nameForProp:index], [[_properties objectAtIndex:index] count], [_times count]+1];
                return NO;
            }
        }
    }
    
    if (hasProp == NO) {
        [self log:@"%@ Must have at least one animatable property", LOG_D];
        return NO;
    }
    
    // Cannot have properties that clash

    if (![[_properties objectAtIndex:SLA_PROP_CENTER] isEqual:[NSNull null]] &&
        ![[_properties objectAtIndex:SLA_PROP_FRAME] isEqual:[NSNull null]]) {
        [self log:@"%@ Cannot animate both center and frame at the same time", LOG_D];
        return NO;
    } else if (![[_properties objectAtIndex:SLA_PROP_TRANSFORM_XY] isEqual:[NSNull null]] &&
                   ![[_properties objectAtIndex:SLA_PROP_TRANSFORM_X] isEqual:[NSNull null]]) {
        [self log:@"%@ Cannot animate both scale (x && y) and scale (y) scale at the same time", LOG_D];
        return NO;
    }
    
    return YES;
}



#pragma mark - Variable arguments to Arrays

- (NSMutableArray *)getArrayFloats:(NSNumber *)firstArg args:(va_list)args {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSNumber *arg = firstArg; arg != nil; arg = va_arg(args, NSNumber *))
        [array addObject:arg];
    va_end(args);
    return array;
}
- (NSMutableArray *)getArrayColors:(UIColor *)firstArg args:(va_list)args {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (UIColor *arg = firstArg; arg != nil; arg = va_arg(args, UIColor *))
        [array addObject:arg];
    va_end(args);
    return array;
}
- (NSMutableArray *)getArrayValues:(NSValue *)firstArg args:(va_list)args {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSValue *arg = firstArg; arg != nil; arg = va_arg(args, NSValue *))
        [array addObject:arg];
    va_end(args);
    return array;
}


#pragma mark - Callback

- (void) completionCallBack {    
    [self invokeCallbackOnTarget:_callbackTarget callbackSelector:_callbackSelector callbackObject:_callbackObject];
}

- (void) invokeCallbackOnTarget:(id)target callbackSelector:(SEL)sel callbackObject:(id)obj {
    if (!target || !sel)
        return;
    
    IMP imp = [target methodForSelector:sel];
    if (!obj) {
        void (*func)(id, SEL) = (void *)imp;
        func(target, sel);
    } else {
        void (*func)(id, SEL, id) = (void *)imp;
        func(target, sel, obj);
    }
    
    return;
}


#pragma mark - Helper / Printers

- (NSString *) nameForProp:(int)prop {
    if (prop == SLA_PROP_ALPHA) return @"Alpha";
    if (prop == SLA_PROP_COLOR_BG) return @"Background Colors";
    if (prop == SLA_PROP_CENTER) return @"Centers";
    if (prop == SLA_PROP_FRAME) return @"Frames";
    if (prop == SLA_PROP_SHADOW_OPACITY) return @"ShadowOpacities";
    if (prop == SLA_PROP_TRANSFORM_XY) return @"Transforms(scale)";
    if (prop == SLA_PROP_TRANSFORM_X) return @"Transforms(horizontal scale)";
    if (prop == SLA_PROP_TRANSFORM_Y) return @"Transforms(vertical scale)";
    return @"Unknown";
}

- (void)log:(NSString *)format, ... {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"HH:mm:ss.SSS"];
    printf("[%s] ", [[formatter stringFromDate:[NSDate new]] UTF8String]);
    va_list args;
    va_start(args, format);
    fputs([[[NSString alloc] initWithFormat:format arguments:args] UTF8String], stdout);
    va_end(args);
    printf("\n");
}
- (CAMediaTimingFunction *) viewAnimationCurveToCoreAnimationTiming:(UIViewAnimationOptions)curve {
    NSString *caMediaTiming = kCAMediaTimingFunctionLinear;
    if (curve == UIViewAnimationOptionCurveEaseIn) caMediaTiming = kCAMediaTimingFunctionEaseIn;
    if (curve == UIViewAnimationOptionCurveEaseOut) caMediaTiming = kCAMediaTimingFunctionEaseOut;
    if (curve == UIViewAnimationOptionCurveEaseInOut) caMediaTiming = kCAMediaTimingFunctionEaseInEaseOut;
    return [CAMediaTimingFunction functionWithName:caMediaTiming];
}


@end
