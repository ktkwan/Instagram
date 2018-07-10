//
//  SignUpViewController.h
//  Instagram
//
//  Created by Katie Kwan on 7/9/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"

@protocol SignUpViewControllerDelegate;

@interface SignUpViewController : UIViewController

@property (nonatomic, weak) id<SignUpViewControllerDelegate> delegate;

@end
