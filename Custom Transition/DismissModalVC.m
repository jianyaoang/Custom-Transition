//
//  DismissModalVC.m
//  Custom Transition
//
//  Created by VLT Labs on 6/19/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

#import "DismissModalVC.h"
#import "ModalViewController.h"
#import "ViewController.h"
#import <POP.h>

@implementation DismissModalVC

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    toViewController.view.userInteractionEnabled = YES;
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    POPBasicAnimation *movingModalVCToOffScreen = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    movingModalVCToOffScreen.name = @"movingModalVCToOffScreen";
    movingModalVCToOffScreen.toValue = @(-fromViewController.view.layer.position.y);
    [movingModalVCToOffScreen setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    [fromViewController.view.layer pop_addAnimation:movingModalVCToOffScreen forKey:@"movingModalVCToOffScreen"];
    
}

@end
