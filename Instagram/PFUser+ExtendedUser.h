//
//  PFUser+ExtendedUser.h
//  Instagram
//
//  Created by Katie Kwan on 7/13/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import "PFUser.h"
#import "Parse.h"
#import "ParseUI.h"

@interface PFUser (ExtendedUser)
@property (strong, nonatomic) PFFile *image;
@end
