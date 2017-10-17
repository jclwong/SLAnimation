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
}

@end

@implementation SLAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    self.view.layer.borderColor = [UIColor colorWithWhite:0.3 alpha:1].CGColor;
    //    self.view.layer.borderWidth = 7;
    
    view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple.png"]];
    [view setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    view.layer.cornerRadius = 5;
    [self.view addSubview:view];
    
    [self resetPosition];
    
    [self performSelector:@selector(animate) withObject:nil afterDelay:0.5];
}

- (void) resetPosition {
    float sW = [UIScreen mainScreen].bounds.size.width;
    float sH = [UIScreen mainScreen].bounds.size.height;
    float vDimen = sH/3;
    
    [view setTransform:CGAffineTransformIdentity];
    
    [view setFrame:CGRectMake(0, 0, vDimen, vDimen)];
    [view setCenter:CGPointMake(sW/2, sH/2)];
}

- (void) animate {
    
        [SLAnimUtil animEffect:SLA_EFFECT_SHAKE view:view time:0.3 delay:0 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    
    //    [SLAnimUtil animEffect:SLA_EFFECT_POP_IN view:view time:0.3 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_SLIDE_LEFT_IN view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_BOUNCE_LEFT_IN view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
//    [SLAnimUtil animEffect:SLA_EFFECT_UNROLL_DOWN_IN view:view time:0.5 delay:0 cbTarget:self cbSelector:@selector(onAnimateChain)];
    
}

- (void) onAnimateChain {
    //    [SLAnimUtil animEffect:SLA_EFFECT_POP_OUT view:view time:0.25 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_SLIDE_LEFT_OUT view:view time:0.4 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    //    [SLAnimUtil animEffect:SLA_EFFECT_BOUNCE_LEFT_OUT view:view time:0.4 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
//    [SLAnimUtil animEffect:SLA_EFFECT_UNROLL_DOWN_OUT view:view time:0.4 delay:0.5 cbTarget:self cbSelector:@selector(onAnimateComplete)];
    
}

- (void) onAnimateComplete {
    [self resetPosition];
    
    [self performSelector:@selector(animate) withObject:nil afterDelay:1];
    
}
@end
