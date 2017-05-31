//
//  SLAnimationUtil.h
//  StepLearn Education
//
//  Created by Jack Wong on 31/5/17.
//  Copyright © 2017 StepLearn Education. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLAnimationUtil : NSObject

// Shorthand methods for "Once-off" animations

+ (BOOL) animateBgColor:(UIColor *)color    view:(UIView *)view time:(float)time;
+ (BOOL) animateTintColor:(UIColor *)color  view:(UIView *)view time:(float)time;
+ (BOOL) animateFrame:(CGRect)frame         view:(UIView *)view time:(float)time;
+ (BOOL) animateCenter:(CGPoint)center      view:(UIView *)view time:(float)time;
+ (BOOL) animateAlpha:(float)alpha          view:(UIView *)view time:(float)time;

+ (BOOL) animateBgColor:(UIColor *)color    view:(UIView *)view time:(float)time callbackTarget:(id)target callbackSelector:(SEL)sel;
+ (BOOL) animateTintColor:(UIColor *)color  view:(UIView *)view time:(float)time callbackTarget:(id)target callbackSelector:(SEL)sel;
+ (BOOL) animateFrame:(CGRect)frame         view:(UIView *)view time:(float)time callbackTarget:(id)target callbackSelector:(SEL)sel;
+ (BOOL) animateCenter:(CGPoint)center      view:(UIView *)view time:(float)time callbackTarget:(id)target callbackSelector:(SEL)sel;
+ (BOOL) animateAlpha:(float)alpha          view:(UIView *)view time:(float)time callbackTarget:(id)target callbackSelector:(SEL)sel;

+ (BOOL) animateAlpha:(float)alpha          view:(UIView *)view time:(float)time callbackTarget:(id)target callbackSelector:(SEL)sel callbackObject:(id)object;

+ (BOOL) animateShakeDistance:(float)dist   view:(UIView *)view time:(float)time callbackTarget:(id)target callbackSelector:(SEL)sel;


@end
