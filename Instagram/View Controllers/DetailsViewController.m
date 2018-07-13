//
//  DetailsViewController.m
//  Instagram
//
//  Created by Katie Kwan on 7/11/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import "DetailsViewController.h"
#import "Parse/Parse.h"
#import "ParseUI.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;



@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadPost];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadPost{
    self.userName.text = self.post.author.username;
    self.caption.text = self.post.caption;
    self.picture.file = self.post.image;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MMMMd h:mm a"];
    self.timeStamp.text = [dateFormat stringFromDate:self.post.createdAt];
    //self.timeStamp.text = self.post.t
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
