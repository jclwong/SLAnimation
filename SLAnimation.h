//
//  SLAnimation.h
//  StepLearn Education
//
//  Created by Jack Wong on 17/08/2016.
//  Copyright © 2016 StepLearn Education. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(int, UAOptions) {
    UALinear,
    UAEaseIn,
    UAEaseOut,
    UAEaseInAndOut
};

@interface SLAnimation : NSObject

- (id) initWithView:(UIView *)view;
- (id) initWithView:(UIView *)view times:(NSNumber *)times, ...;

- (void)setView:(UIView *)view;
- (void)setTimes:(NSNumber *)times, ...;
- (void)setAlphas:(NSNumber *)alpha, ...;
- (void)setBgColors:(UIColor *)color, ...;
- (void)setTintColors:(UIColor *)color, ...;
- (void)setCenters:(NSValue *)centers, ...;
- (void)setFrames:(NSValue *)frame, ...;
- (void)setShadowOpacities:(NSNumber *)shadowOpacities, ...;
- (void)setTransformScale:(NSNumber *)scales, ...;
- (void)setTransformVerticalScale:(NSNumber *)scales, ...;

- (void)setCallbackTarget:(id)callbackTarget callbackSelector:(SEL)callbackSelector;
- (void)setCallbackTarget:(id)callbackTarget callbackSelector:(SEL)callbackSelector callbackObject:(id)callbackObject;

- (void)setDelay:(float)aDelay;
- (void)setAnimationOption:(int)option;

- (BOOL)animate;

- (void) printAnimProps;

@end
