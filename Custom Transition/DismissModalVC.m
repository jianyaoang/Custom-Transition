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

@implementation DismissModalVC

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    
}

@end
