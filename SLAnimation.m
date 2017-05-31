//
//  SLAnimation.m
//  StepLearn Education
//
//  Created by Jack Wong on 17/08/2016.
//  Copyright © 2016 StepLearn Education. All rights reserved.
//


#import <QuartzCore/CAAnimation.h>
#import "SLAnimation.h"

#define NUM_ANIM_PROP 8

#define ANIM_PROP_ALPHA 0
#define ANIM_PROP_COLOR_BG 1
#define ANIM_PROP_COLOR_TINT 2

#define ANIM_PROP_CENTER 3
#define ANIM_PROP_FRAME 4

#define ANIM_PROP_SHADOW_OPACITY 5
#define ANIM_PROP_TRANSFORM_SCALE 6
#define ANIM_PROP_TRANSFORM_VERTICAL_SCALE 7

#define LOG_D [NSString stringWithFormat:@"[Line %3d] %s ", __LINE__, __PRETTY_FUNCTION__]

@interface SLAnimation () {
    
    UIView *_view;
    
    id _callbackTarget;
    SEL _callbackSelector;
    id _callbackObject;

    NSMutableArray *_times;
    NSMutableArray *_properties;
    float delay;
    
    int currentAnimationStep;
    BOOL isAnimating;
    
    UIViewAnimationOptions animationOption;
}
@end

@implementation SLAnimation

#pragma mark - Init

- (id) init {
    return [self initWithView:nil];
}

- (id) initWithView:(UIView *)view {
    self = [super init];
    _view = view;
    isAnimating = NO;
    _properties = [NSMutableArray new];
    delay = 0;
    animationOption = UIViewAnimationOptionCurveLinear;
    for (int index = 0; index < NUM_ANIM_PROP; index++)
        [_properties addObject:[NSNull null]];
    return self;
}
- (id) initWithView:(UIView *)view times:(NSNumber *)times, ... {
    self = [self initWithView:view];
    if (times) {
        va_list args;
        va_start(args, times);
        _times = [self getArrayFloats:times args:args];
    }
    return self;
}


#pragma mark - Property settings

- (void) setView:(UIView *)view {
    _view = view;
}
- (void) setTimes:(NSNumber *)times, ... {
    va_list args;
    va_start(args, times);
    _times = [self getArrayFloats:times args:args];
}
- (void) setAlphas:(NSNumber *)alpha, ... {
    va_list args;
    va_start(args, alpha);
    [_properties replaceObjectAtIndex:ANIM_PROP_ALPHA withObject: [self getArrayFloats:alpha args:args]];
}
- (void) setBgColors:(UIColor *)color, ... {
    va_list args;
    va_start(args, color);
    [_properties replaceObjectAtIndex:ANIM_PROP_COLOR_BG withObject: [self getArrayColors:color args:args]];
}
- (void) setTintColors:(UIColor *)color, ... {
    va_list args;
    va_start(args, color);
    [_properties replaceObjectAtIndex:ANIM_PROP_COLOR_TINT withObject: [self getArrayColors:color args:args]];
}
- (void) setCenters:(NSValue *)centers, ... {
    va_list args;
    va_start(args, centers);
    [_properties replaceObjectAtIndex:ANIM_PROP_CENTER withObject: [self getArrayValues:centers args:args]];
}
- (void) setFrames:(NSValue *)frames, ... {
    va_list args;
    va_start(args, frames);
    [_properties replaceObjectAtIndex:ANIM_PROP_FRAME withObject: [self getArrayValues:frames args:args]];
}
- (void) setShadowOpacities:(NSNumber *)shadowOpacities, ... {
    va_list args;
    va_start(args, shadowOpacities);
    [_properties replaceObjectAtIndex:ANIM_PROP_SHADOW_OPACITY withObject: [self getArrayFloats:shadowOpacities args:args]];
}
- (void) setTransformScale:(NSNumber *)scales, ... {
    va_list args;
    va_start(args, scales);
    [_properties replaceObjectAtIndex:ANIM_PROP_TRANSFORM_SCALE withObject: [self getArrayFloats:scales args:args]];
}
- (void) setTransformVerticalScale:(NSNumber *)scales, ... {
    va_list args;
    va_start(args, scales);
    [_properties replaceObjectAtIndex:ANIM_PROP_TRANSFORM_VERTICAL_SCALE withObject: [self getArrayFloats:scales args:args]];
}
- (void) setCallbackTarget:(id)callbackTarget callbackSelector:(SEL)callbackSelector {
    [self setCallbackTarget:callbackTarget callbackSelector:callbackSelector callbackObject:nil];
}
- (void) setCallbackTarget:(id)callbackTarget callbackSelector:(SEL)callbackSelector callbackObject:(id)callbackObject {
    _callbackTarget = callbackTarget;
    _callbackSelector = callbackSelector;
    _callbackObject = callbackObject;
}
- (void) setDelay:(float)aDelay {
    delay = aDelay;
}
- (void) setAnimationOption:(int)option {
    if (option == UALinear) animationOption = UIViewAnimationOptionCurveLinear;
    if (option == UAEaseIn) animationOption = UIViewAnimationOptionCurveEaseIn;
    if (option == UAEaseOut) animationOption = UIViewAnimationOptionCurveEaseOut;
    if (option == UAEaseInAndOut) animationOption = UIViewAnimationOptionCurveEaseInOut;
}


#pragma mark - Animation

- (BOOL) animate {
    
    if (![self canAnimate])
        return NO;
    
    isAnimating = YES;
    currentAnimationStep = 0;
    [self animateViewWithPropsAtStep:currentAnimationStep];
    
    if (delay == 0) {
        [self animationStep];
    } else {
        [self performSelector:@selector(animationStep) withObject:nil afterDelay:delay];
    }

    return YES;
}

- (void) animationStep {
    [UIView animateWithDuration:[[_times objectAtIndex:currentAnimationStep] doubleValue] delay:0
                        options:(animationOption | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [self animateViewWithPropsAtStep:currentAnimationStep + 1];
                     } completion: ^(BOOL finished) {
                         currentAnimationStep++;
                         
                         if (currentAnimationStep < [_times count]) {
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
    if (property == ANIM_PROP_ALPHA)
        [_view setAlpha:[[[_properties objectAtIndex:property] objectAtIndex:step] doubleValue]];
    
    if (property == ANIM_PROP_COLOR_BG)
        [_view setBackgroundColor:[[_properties objectAtIndex:property] objectAtIndex:step]];
    
    if (property == ANIM_PROP_COLOR_TINT)
        [_view setTintColor:[[_properties objectAtIndex:property] objectAtIndex:step]];
    
    if (property == ANIM_PROP_CENTER)
        [_view setCenter:[[[_properties objectAtIndex:property] objectAtIndex:step] CGPointValue]];
    
    if (property == ANIM_PROP_FRAME)
        [_view setFrame:[[[_properties objectAtIndex:property] objectAtIndex:step] CGRectValue]];
    
    if (property == ANIM_PROP_SHADOW_OPACITY && step != 0) {
        [self setViewShadowOpacityFrom:[[_properties objectAtIndex:property] objectAtIndex:step-1]
                                    to:[[_properties objectAtIndex:property] objectAtIndex:step]
                              duration:[[_times objectAtIndex:step-1] floatValue]];
    }
    
    if (property == ANIM_PROP_TRANSFORM_SCALE) {
        [_view setTransform:CGAffineTransformIdentity];
        [_view setTransform:CGAffineTransformMakeScale([[[_properties objectAtIndex:property] objectAtIndex:step] doubleValue],
                                                       [[[_properties objectAtIndex:property] objectAtIndex:step] doubleValue])];
    }
    
    if (property == ANIM_PROP_TRANSFORM_VERTICAL_SCALE) {
        [_view setTransform:CGAffineTransformIdentity];
        [_view setTransform:CGAffineTransformMakeScale(1, [[[_properties objectAtIndex:property] objectAtIndex:step] doubleValue])];
    }
}

- (void) setViewShadowOpacityFrom:(NSValue *)from to:(NSValue *)to duration:(float)duration {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    anim.fromValue = from;
    anim.toValue = to;
    anim.duration = duration;
    [_view.layer addAnimation:anim forKey:@"shadowOpacity"];
}

- (BOOL) canAnimate {
    if (isAnimating) {
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
    
    if (delay < 0) {
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

    if (![[_properties objectAtIndex:ANIM_PROP_CENTER] isEqual:[NSNull null]] &&
        ![[_properties objectAtIndex:ANIM_PROP_FRAME] isEqual:[NSNull null]]) {
        [self log:@"%@ Cannot animate both center and frame at the same time", LOG_D];
        return NO;
    } else if (![[_properties objectAtIndex:ANIM_PROP_TRANSFORM_SCALE] isEqual:[NSNull null]] &&
                   ![[_properties objectAtIndex:ANIM_PROP_TRANSFORM_VERTICAL_SCALE] isEqual:[NSNull null]]) {
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

- (void) printAnimProps {
    if (_view) [self log:@"%@ View: %@", LOG_D, _view];
    if (_times) [self log:@"%@ Times: %@", LOG_D, _times];
    for (int index = 0; index < [_properties count]; index++)
        [self log:@"%@ %@: %@", LOG_D, [self nameForProp:index], [_properties objectAtIndex:index]];
    if (_callbackTarget) [self log:@"%@ CallbackTarget: %@", LOG_D, _callbackTarget];
}

- (NSString *) nameForProp:(int)prop {
    if (prop == ANIM_PROP_ALPHA) return @"Alpha";
    if (prop == ANIM_PROP_COLOR_BG) return @"Colors";
    if (prop == ANIM_PROP_CENTER) return @"Centers";
    if (prop == ANIM_PROP_FRAME) return @"Frames";
    if (prop == ANIM_PROP_SHADOW_OPACITY) return @"ShadowOpacities";
    if (prop == ANIM_PROP_TRANSFORM_VERTICAL_SCALE) return @"Transforms(vertical scale)";
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

@end
