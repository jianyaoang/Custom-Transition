//
//  ViewController.m
//  Custom Transition
//
//  Created by VLT Labs on 6/19/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

#import "ViewController.h"
#import "PresentModalVC.h"
#import "DismissModalVC.h"
#import "ModalViewController.h"
#import <POP.h>

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) IBOutlet UIButton *tadaButton;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Custom Transition";
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self stylingTadaButton];
    [self descriptionLabel];
}

#pragma mark - styling description label
-(void)stylingDescriptionLabel {
    
    self.descriptionLabel.text = @"Transition";
    self.descriptionLabel.alpha = 0;
}

#pragma mark - button
- (IBAction)onTadaButtonPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ModalViewController *mvc = [storyboard instantiateViewControllerWithIdentifier:@"ModalViewController"];
    mvc.transitioningDelegate = self;
    mvc.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController presentViewController:mvc animated:YES completion:nil];
}

-(void)stylingTadaButton {
    
    [self.tadaButton setTitle:@"What's this about?" forState:UIControlStateNormal];
    [self.tadaButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.tadaButton setBackgroundColor:[UIColor colorWithRed:0.50 green:0.50 blue:1.00 alpha:1]];
    self.tadaButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    POPSpringAnimation *springAnim = [POPSpringAnimation animation];
    springAnim.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    springAnim.fromValue = [NSValue valueWithCGRect:CGRectMake(57, 360, 286, 81)];
    springAnim.toValue = [NSValue valueWithCGRect:CGRectMake(57, 300, 286, 81)];
    springAnim.springSpeed = 3.5;
    springAnim.springBounciness = 30;
    springAnim.name = @"springAnim";
    springAnim.delegate = self;
    
    [self.tadaButton pop_addAnimation:springAnim forKey:@"springAnim"];
    
    [springAnim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        
        self.descriptionLabel.text = @"Transition Complete";
        self.descriptionLabel.alpha = 1.0;
        
    }];

}

#pragma mark - transition

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [PresentModalVC new];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [DismissModalVC new];
    
}





@end
