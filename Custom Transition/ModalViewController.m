//
//  ModalViewController.m
//  Custom Transition
//
//  Created by VLT Labs on 6/19/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *randomTextField;
@property (strong, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self stylingDismissButton];
    
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.50 blue:0.50 alpha:1];
    self.view.layer.cornerRadius = 20.0f;

}

#pragma mark - text field
-(void)stylingRandomTextField {
    
    self.randomTextField.placeholder = @"Just some random animation";
    self.randomTextField.delegate = self;
    self.randomTextField.backgroundColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1];
    self.randomTextField.textColor = [UIColor blackColor];
    self.randomTextField.font = [UIFont fontWithName:@"Helvetica" size:30];
}

#pragma mark - dismiss button
- (IBAction)onDismissButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)stylingDismissButton {
    
    [self.dismissButton setTitle:@"Okay, got it!" forState:UIControlStateNormal];
    [self.dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.dismissButton setBackgroundColor:[UIColor redColor]];
    self.dismissButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    
}


@end
