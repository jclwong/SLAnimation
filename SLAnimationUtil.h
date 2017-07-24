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


#pragma mark - UIEffects


// Shake

+ (BOOL) shakeWithView:(UIView *)view time:(float)time;
+ (BOOL) shakeWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) shakeWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;

// Pop

+ (BOOL) popInWithView:(UIView *)view time:(float)time;
+ (BOOL) popInWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) popInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;
+ (BOOL) popOutWithView:(UIView *)view time:(float)time;
+ (BOOL) popOutWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) popOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;

// Slide Left

+ (BOOL) slideLeftInWithView:(UIView *)view time:(float)time;
+ (BOOL) slideLeftInWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) slideLeftInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;
+ (BOOL) slideLeftOutWithView:(UIView *)view time:(float)time;
+ (BOOL) slideLeftOutWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) slideLeftOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;

// Slide Right

+ (BOOL) slideRightInWithView:(UIView *)view time:(float)time;
+ (BOOL) slideRightInWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) slideRightInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;
+ (BOOL) slideRightOutWithView:(UIView *)view time:(float)time;
+ (BOOL) slideRightOutWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) slideRightOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;

// Bounce Left

+ (BOOL) bounceLeftInWithView:(UIView *)view time:(float)time;
+ (BOOL) bounceLeftInWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) bounceLeftInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;
+ (BOOL) bounceLeftOutWithView:(UIView *)view time:(float)time;
+ (BOOL) bounceLeftOutWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) bounceLeftOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;

// Bounce Right

+ (BOOL) bounceRightInWithView:(UIView *)view time:(float)time;
+ (BOOL) bounceRightInWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) bounceRightInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;
+ (BOOL) bounceRightOutWithView:(UIView *)view time:(float)time;
+ (BOOL) bounceRightOutWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) bounceRightOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;


// Unroll down

+ (BOOL) unrollDownInWithView:(UIView *)view time:(float)time;
+ (BOOL) unrollDownInWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) unrollDownInWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;
+ (BOOL) unrollDownOutWithView:(UIView *)view time:(float)time;
+ (BOOL) unrollDownOutWithView:(UIView *)view time:(float)time delay:(float)delay;
+ (BOOL) unrollDownOutWithView:(UIView *)view time:(float)time delay:(float)delay cbTarget:(id)target cbSelector:(SEL)selector;



@end
