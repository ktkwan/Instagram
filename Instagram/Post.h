//
//  Post.h
//  Instagram
//
//  Created by Katie Kwan on 7/10/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Parse/Parse.h"
#import "PFObject.h"

@interface Post : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;
@property (nonatomic) BOOL liked;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;

@end
