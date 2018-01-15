//
//  SLAnim.h
//  StepLearn Education
//
//  Created by Jack Wong on 17/08/2016.
//  Copyright © 2016 StepLearn Education. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SLAOptions) {
    SLA_TIME_LINEAR,
    SLA_TIME_EASE_IN,
    SLA_TIME_EASE_OUT,
    SLA_TIME_EASE_IN_OUT
};

typedef NS_ENUM(NSUInteger, SLAnimProps) {
    SLA_PROP_ALPHA,
    SLA_PROP_CENTER,
    SLA_PROP_COLOR_BG,
    SLA_PROP_FRAME,
    SLA_PROP_SHADOW_OPACITY,
    SLA_PROP_TRANSFORM_X,
    SLA_PROP_TRANSFORM_Y,
    SLA_PROP_TRANSFORM_XY,
    SLA_PROP_ROTATE,
    
    SLA_PROP_COUNT
};

@interface SLAnim : NSObject

- (id) initWithView:(UIView *)view;
- (id) initWithView:(UIView *)view times:(NSArray *)times;

// Compulsary Properties
- (void)setView:(UIView *)view;
- (void)setTimes:(NSArray *)times;

// Properties: At least 1 need sto be set
- (void)setProp:(int)prop values:(NSArray *)values;

// Optional Properties
- (void)setDelay:(float)aDelay;
- (void)setAnimationOption:(int)option;
- (void)setCallbackTarget:(id)callbackTarget callbackSelector:(SEL)callbackSelector;
- (void)setCallbackTarget:(id)callbackTarget callbackSelector:(SEL)callbackSelector callbackObject:(id)callbackObject;

- (BOOL)animate;

@end
