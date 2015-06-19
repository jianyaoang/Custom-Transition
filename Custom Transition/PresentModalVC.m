//
//  PresentModalVC.m
//  Custom Transition
//
//  Created by VLT Labs on 6/19/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

#import "PresentModalVC.h"
#import "ModalViewController.h"
#import "ViewController.h"
#import <POP.h>

@implementation PresentModalVC

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.userInteractionEnabled = NO;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    
    UIView *dimmedViewFromView = [[UIView alloc] initWithFrame:fromView.bounds];
    dimmedViewFromView.backgroundColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:0.7];
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0, 0, CGRectGetWidth(transitionContext.containerView.bounds) - 50.0f, CGRectGetHeight(transitionContext.containerView.bounds)- 350.0f);
    toView.center = CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y);
    
    [transitionContext.containerView addSubview:dimmedViewFromView];
    [transitionContext.containerView addSubview:toView];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.name = @"scaleAnimation";
    scaleAnimation.springBounciness = 20;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.7)];

    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    springAnimation.name = @"springAnimation";
    springAnimation.toValue = @(transitionContext.containerView.center.y);
    springAnimation.springBounciness = 20;
    [springAnimation setCompletionBlock:^(POPAnimation *animate, BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
    
    [toView.layer pop_addAnimation:springAnimation forKey:@"springAnimation"];
    [toView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];

}

@end
