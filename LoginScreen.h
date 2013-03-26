//
//  LoginScreen.h
//  tableViewPractice
//
//  Created by Lalo on 23/03/2013.
//  Copyright (c) 2013 Lalo. All rights reserved.
//

#import "ViewController.h"

@interface LoginScreen : ViewController
@property (strong, nonatomic) IBOutlet UITextField *usernameText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)loginButtonPressed:(id)sender;

@end
