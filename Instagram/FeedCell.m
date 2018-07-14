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
#import "DateTools.h"


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
    
    PFUser *newUser = [PFUser currentUser];
    
    self.userNameLabel.text = newUser.username;
    self.postImage.file = self.post.image;
    
    self.timeStamp.text = [self.post.createdAt timeAgoSinceNow];
    
    //NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
   // [dateFormat setDateFormat:@"MMMMd h:mm a"];
    //self.timeStamp.text = [dateFormat stringFromDate:self.post.createdAt];
    NSString* likeCount = [NSString stringWithFormat:@"%@", self.post.likeCount];
    self.likeLabel.text = likeCount;
}
- (IBAction)didTapLikeButton:(id)sender {
   
    if (self.post.liked == NO){
        self.likeButton.selected = YES;
        self.post.liked = YES;
        int likes = [self.post.likeCount intValue] + 1;
        self.post.likeCount = [NSNumber numberWithInteger:likes];
        self.likeLabel.text = [self.post.likeCount stringValue];
        
        
    } else {
        self.post.liked = NO;
        self.likeButton.selected = NO;
        int likes = [self.post.likeCount intValue] - 1;
        self.post.likeCount = [NSNumber numberWithInteger:likes];
        self.likeLabel.text = [self.post.likeCount stringValue];
        //self.post.likeCount -= 1;
    }
}





@end
