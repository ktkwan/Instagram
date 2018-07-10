//
//  ComposeViewController.h
//  Instagram
//
//  Created by Katie Kwan on 7/10/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol composeViewControllerDelegate;

@interface ComposeViewController : UIViewController

@property (nonatomic, weak) id<composeViewControllerDelegate> delegate;

@end
