//
//  FeedCell.h
//  Instagram
//
//  Created by Katie Kwan on 7/9/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse.h"
#import "ParseUI.h"
#import "DateTools.h"

@interface FeedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;

@end
