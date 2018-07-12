//
//  LoginViewController.m
//  Instagram
//
//  Created by Katie Kwan on 7/9/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse.h"
#import "FeedViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)loginButton:(id)sender;
- (IBAction)signUpButton:(id)sender;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            
            // display view controller that needs to shown after successful login
        }
    }];
}

- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
    //newUser.email = self.emailField.text;
    newUser.password = self.passwordField.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            
            // manually segue to logged in view
        }
    }];
    
}

- (void) notification{
    if ([self.usernameField.text isEqual:@""]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please type in username and password" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle cancel response here. Doing nothing will dismiss the view.
                                                             }];
        // add the cancel action to the alertController
        [alert addAction:cancelAction];
        
        // create an OK action
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * _Nonnull action) {
                                                             // handle response here.
                                                         }];
        // add the OK action to the alert controller
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
        
        
    }
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 
 if( [segue.identifier isEqualToString:@"segueToSignUpViewController" ] ){
 
 SignUpViewController *signUpViewController = [segue destinationViewController];
 
 signUpViewController.delegate = self;
 } else {
 FeedViewController *feedViewController = [segue destinationViewController];
 
 feedViewController.delegate = self;
 
 }
 
 }
 */

- (IBAction)loginButton:(id)sender {
    [self loginUser];
    [self notification];
    
}


- (IBAction)signUpButton:(id)sender {
    [self registerUser];
    [self notification];
    
    
    
}


@end
