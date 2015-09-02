//
//  SignUpVC.m
//  InTown
//
//  Created by Ronald Hernandez on 9/1/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

#import "SignUpVC.h"
#import "Firebase/Firebase.h"

@interface SignUpVC ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UITextField *username;
@property Firebase *rootRef;
@property CGFloat animatedDistance;

@end

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:94.0/255.0 blue:1.0/255.0 alpha:1.0]];

    self.rootRef = [[Firebase alloc] initWithUrl:@"https://intown.firebaseio.com/"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSignUpButtonTapped:(UIButton *)sender {
    NSString *error = [NSString new];

    if ([self.emailTextField.text isEqualToString:@""] || [self.username.text isEqualToString:@""] || [self.emailTextField.text isEqualToString:@""]) {
        error = @"All fields are required, please try again!";


        [self displayAlertWithTitle:@"All Fields Required!" andWithMessage:error];
    }else{

        [self.rootRef createUser:@"bobtony@example.com" password:@"correcthorsebatterystaple"
     withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
         if (error) {
             // There was an error creating the account
         } else {
             NSString *uid = [result objectForKey:@"uid"];
             NSLog(@"Successfully created user account with uid: %@", uid);


             UIStoryboard *profileStoryboard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
             UINavigationController *profileNavVC = [profileStoryboard instantiateViewControllerWithIdentifier:@"profileNavVC"];


             [self presentViewController:profileNavVC animated:YES completion:nil];
         }
     }];
    }
}

- (IBAction)onTermsAndConditionButtonTapped:(id)sender {
}

- (IBAction)onCancelButtonTapped:(UIButton *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}
    //************Helper Methods ****************************//
    //Display general alert

 -(void)displayAlertWithTitle:(NSString *)title andWithMessage:(NSString *)message{

        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

        [alertView show];
        
        
    }

#pragma Marks - hiding keyboard
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0){
        heightFraction = 0.0;
    }
    else if(heightFraction > 1.0){
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown){
        self.animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else{
        self.animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= self.animatedDistance;

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];

    [self.view setFrame:viewFrame];

    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textfield{

    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += self.animatedDistance;

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];

    [self.view setFrame:viewFrame];

    [UIView commitAnimations];
}
////hide keyboard when the user clicks return
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

    [self.view endEditing:true];
    return true;
}
//hide keyboard when user touches outside.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
