//
//  SLAnimationViewController.m
//  SLAnimation
//
//  Created by jclwong on 10/17/2017.
//  Copyright (c) 2017 jclwong. All rights reserved.
//

#import "SLAnimationViewController.h"

#import <SLAnimation/SLAnim.h>
#import <SLAnimation/SLAnimUtil.h>

@interface SLAnimationViewController () {
    UIImageView *view;
    float angle;
}
@end

@implementation SLAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    
    angle = 0;
    
    view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple.png"]];
    view.layer.cornerRadius = 5;
    view.layer.anchorPoint = CGPointMake(0,0);
    [self.view addSubview:view];
    
    [self performSelector:@selector(animate) withObject:nil afterDelay:0.5];
}

- (void) resetPosition {
    float sW = [UIScreen mainScreen].bounds.size.width;
    float sH = [UIScreen mainScreen].bounds.size.height;
    float vDimen = sH/3;
    
    [view setAlpha:1];
    [view setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [view setTransform:CGAffineTransformIdentity];
    [view setFrame:CGRectMake(0, 0, vDimen, vDimen)];
    [view setCenter:CGPointMake(sW/2, sH/2)];
}

- (void) animate {
    [self resetPosition];

    // Effects
    [SLAnimUtil animEffect:SLA_EFFECT_SHAKE view:view time:0.3 delay:0 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_POP_IN view:view time:0.3 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_SLIDE_LEFT_IN view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_BOUNCE_LEFT_IN view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_UNROLL_DOWN_IN view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_FALL_IN view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_RISE_IN view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
    
    // Props
    //    [SLAnimUtil animProp:SLA_PROP_ALPHA animValue:@0.5 view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    //    [SLAnimUtil animProp:SLA_PROP_COLOR_BG animValue:[UIColor redColor] view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    
    
    NSLog(@"view.transform.a: %.3f", view.transform.a);
    NSLog(@"view.transform.b: %.3f", view.transform.b);
    NSLog(@"view.transform.c: %.3f", view.transform.c);
    NSLog(@"view.transform.d: %.3f", view.transform.d);
    NSLog(@"Current Calculated angle: %.3f", atan2f(view.transform.b, view.transform.a));

    
    // Angle Test
//    CGFloat radiansFrom = (angle) / 180 * M_PI;
//    CGFloat radiansTo = (angle+15) / 180 * M_PI;
//    [SLAnimUtil animProp:SLA_PROP_ROTATE animValue:@(radiansTo) view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateComplete)];
//    angle = angle+15;

}

- (void) onAnimateChain {
    //    [SLAnimUtil animEffect:SLA_EFFECT_POP_OUT view:view time:0.25 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_SLIDE_LEFT_OUT view:view time:0.4 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_BOUNCE_LEFT_OUT view:view time:0.4 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_UNROLL_DOWN_OUT view:view time:0.4 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_FALL_OUT view:view time:0.4 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_RISE_OUT view:view time:0.4 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
}

- (void) onAnimateComplete {
    NSLog(@"onAnimateComplete");
    
    [self performSelector:@selector(animate) withObject:nil afterDelay:1];
}
@end
