//
//  ProfileViewController.h
//  Instagram
//
//  Created by Katie Kwan on 7/10/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProfileViewControllerDelegate
@end

@interface ProfileViewController : UIViewController

@property (nonatomic, strong) id<ProfileViewControllerDelegate> delegate;

@end
