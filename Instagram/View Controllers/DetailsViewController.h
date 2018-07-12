//
//  DetailsViewController.h
//  Instagram
//
//  Created by Katie Kwan on 7/11/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Post *post;

- (void) loadPost;

@end
