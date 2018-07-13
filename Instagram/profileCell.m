//
//  ProfileCell.m
//  Instagram
//
//  Created by Katie Kwan on 7/12/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import "ProfileCell.h"
#import "Parse.h"
#import "ParseUI.h"
#import "Post.h"


@implementation ProfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setPost:(Post *)post {
    _post = post;
    self.posts.file = self.post[@"image"];
    [self.posts loadInBackground];
    self.posts.file = self.post.image;
    
}



@end
