//
//  LoginScreen.m
//  tableViewPractice
//
//  Created by Lalo on 23/03/2013.
//  Copyright (c) 2013 Lalo. All rights reserved.
//

#import "LoginScreen.h"
#import "ViewController.h"

@interface LoginScreen ()

@end

@implementation LoginScreen
@synthesize passwordText, usernameText, loginButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ucl.jpg"]];
}


# pragma mark - Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == usernameText){
        NSLog(@"GO pressed");
        [self.passwordText becomeFirstResponder];
    }
    else if (textField == passwordText){
        NSLog(@"DONE pressed");
        if ([self areUserAndPasswordCorrect]){
            NSLog(@"Successful Login");
            ViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"view2"];
            [self presentViewController:view animated:YES completion:nil];
        }
    }
    return YES;
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if([self.passwordText isFirstResponder] && [touch view] != self.usernameText){
        [self.passwordText resignFirstResponder];
    }
    else if([self.usernameText isFirstResponder] && [touch view] != self.passwordText){
        [self.usernameText resignFirstResponder];
    }
}

# pragma mark - Other methods	

- (BOOL) areUserAndPasswordCorrect
{
    if ([self.usernameText.text isEqualToString:@"test"] && [self.passwordText.text isEqualToString:@"test"]) {
        return YES;
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Wrong username or password"
                                                      delegate: self
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    
}

- (IBAction)loginButtonPressed:(id)sender {
    if ([self areUserAndPasswordCorrect]){
        NSLog(@"Successful Login");
        ViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"view2"];
        [self presentViewController:view animated:YES completion:nil];
    }
}
@end
