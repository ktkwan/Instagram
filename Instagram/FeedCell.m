//
//  FeedCell.m
//  Instagram
//
//  Created by Katie Kwan on 7/9/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI.h"
#import "FeedCell.h"


@implementation FeedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    _post = post;
    self.postImage.file = self.post[@"image"];
    [self.postImage loadInBackground];
    self.captionLabel.text = self.post.caption;
}





@end
