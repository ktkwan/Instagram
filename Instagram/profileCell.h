//
//  ProfileCell.h
//  Instagram
//
//  Created by Katie Kwan on 7/12/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"
#import "ParseUI.h"
#import "Post.h"

@interface ProfileCell : UICollectionViewCell




@property (weak, nonatomic) IBOutlet PFImageView *posts;



@property (strong, nonatomic) Post *post;

@end
