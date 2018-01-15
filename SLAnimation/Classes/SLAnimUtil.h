//
//  SLAnimUtil.h
//  StepLearn Education
//
//  Created by Jack Wong on 31/5/17.
//  Copyright © 2017 StepLearn Education. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLAnimUtil : NSObject

typedef NS_ENUM(NSUInteger, SLAnimEffects) {
    SLA_EFFECT_SHAKE,
    SLA_EFFECT_POP_IN,          
    SLA_EFFECT_POP_OUT,
    SLA_EFFECT_RISE_IN,
    SLA_EFFECT_RISE_OUT,
    SLA_EFFECT_FALL_IN,
    SLA_EFFECT_FALL_OUT,
    SLA_EFFECT_SLIDE_LEFT_IN,
    SLA_EFFECT_SLIDE_LEFT_OUT,
    SLA_EFFECT_SLIDE_RIGHT_IN,
    SLA_EFFECT_SLIDE_RIGHT_OUT,
    SLA_EFFECT_BOUNCE_LEFT_IN,
    SLA_EFFECT_BOUNCE_LEFT_OUT,
    SLA_EFFECT_BOUNCE_RIGHT_IN,
    SLA_EFFECT_BOUNCE_RIGHT_OUT,
    SLA_EFFECT_UNROLL_DOWN_IN,
    SLA_EFFECT_UNROLL_DOWN_OUT,
    
    SLA_EFFECT_FADE_DOWN_IN,
    SLA_EFFECT_FADE_DOWN_OUT,
    SLA_EFFECT_FADE_UP_IN,
    SLA_EFFECT_FADE_UP_OUT
};

+ (BOOL) animProp:(int)prop animValue:(NSObject *)animValue view:(UIView *)view time:(float)time;
+ (BOOL) animProp:(int)prop animValue:(NSObject *)animValue view:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) animProp:(int)prop animValue:(NSObject *)animValue view:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;
+ (BOOL) animProp:(int)prop animValue:(NSObject *)animValue view:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector cbObject:(id)cbObject;

+ (BOOL) animEffect:(int)effect view:(UIView *)view time:(float)time;
+ (BOOL) animEffect:(int)effect view:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) animEffect:(int)effect view:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;
+ (BOOL) animEffect:(int)effect view:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector cbObject:(id)cbObject;


@end
