//
//  FeedViewController.h
//  Instagram
//
//  Created by Katie Kwan on 7/9/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FeedViewControllerDelegate
@end

@interface FeedViewController : UIViewController
@property (nonatomic, strong) id<FeedViewControllerDelegate> delegate;

@end
