//
//  WelcomeVC.m
//  InTown
//
//  Created by Ronald Hernandez on 9/1/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

#import "WelcomeVC.h"

@interface WelcomeVC ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;

@end

@implementation WelcomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//
//    [self.backgroundView setBackgroundColor: [UIColor colorWithRed:255.0/255.0 green:94.0/255.0 blue:1.0/255.0 alpha:1.0]];
    [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:94.0/255.0 blue:1.0/255.0 alpha:1.0]];

    self.loginButton.layer.borderWidth = 2.0;
    self.signupButton.layer.borderWidth = 2.0;
    self.loginButton.layer.borderColor  = [UIColor whiteColor].CGColor;
    self.signupButton.layer.borderColor = [UIColor whiteColor].CGColor;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)onLoginButtonTapped:(UIButton *)sender {




}

- (IBAction)onSignUpButtonTapped:(UIButton *)sender {


}
- (IBAction)onSignInWithFacebookButtonTapped:(UIButton *)sender {



}

- (IBAction)onSignInWithTwitterButtonTapped:(UIButton *)sender {

    
}
@end
