//
//  ProfileViewController.m
//  Instagram
//
//  Created by Katie Kwan on 7/10/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import "ProfileViewController.h"
#import "Parse.h"
#import "ParseUI.h"
#import "ProfileCell.h"
#import "Post.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"

@interface ProfileViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *feedArray;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self onTimer];
    [self viewWillAppear:true];
    
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    
    
    CGFloat postersPerLine = 3;
    CGFloat itemWidth = self.collectionView.frame.size.width / postersPerLine;
    CGFloat itemHeight = 1.5*itemWidth;
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    
    
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onTimer) forControlEvents:UIControlEventValueChanged];
    [self.collectionView insertSubview:self.refreshControl atIndex:0];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    [self onTimer];
    [self.collectionView reloadData];
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (void) onTimer{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query whereKey:@"author" equalTo:PFUser.currentUser];
    [query orderByDescending:@"createdAt"];
    query.limit = 20;
    self.userNameLabel.text = PFUser.currentUser.username;
    
    
    [query includeKeys:@[@"author", @"createdAt"]];
    //[query orderByDescending:@"createdAt"];
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            //             do something with the array of object returned by the call
            self.feedArray = posts;
            [self.collectionView reloadData];
            [self.refreshControl endRefreshing];
            
            
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}






#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if( [segue.identifier isEqualToString:@"segueToDetails"]){
        
        UICollectionViewCell *tappedCell = sender;
        
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:tappedCell];
        
        Post *postToSend = self.feedArray[indexPath.row];
        
        DetailsViewController *detailsViewController = [segue destinationViewController];
        
        detailsViewController.post = postToSend;
        
    }
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProfileCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileCell" forIndexPath:indexPath];
    Post *message = self.feedArray[indexPath.row];
    cell.post = message;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.feedArray.count;
}




@end
