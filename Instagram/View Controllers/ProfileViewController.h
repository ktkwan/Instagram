//
//  ProfileViewController.h
//  Instagram
//
//  Created by Katie Kwan on 7/10/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@protocol ProfileViewControllerDelegate
@end

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;



@property (nonatomic, strong) id<ProfileViewControllerDelegate> delegate;

@end
