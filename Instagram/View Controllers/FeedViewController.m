//
//  FeedViewController.m
//  Instagram
//
//  Created by Katie Kwan on 7/9/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedCell.h"
#import "Parse.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Post.h"
#import "ParseUI.h"
#import "DetailsViewController.h"

@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *feedArray;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *logOutButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *pictureButton;



@end



@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    
    
    // Do any additional setup after loading the view.
    //    [self.tableView reloadData];
    [self onTimer];
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onTimer) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    [self onTimer];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onTimer{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    query.limit = 20;
    
    [query includeKeys:@[@"author", @"createdAt"]];
    //[query orderByDescending:@"createdAt"];
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            //             do something with the array of object returned by the call
            self.feedArray = posts;
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
            
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if( [segue.identifier isEqualToString:@"segueToDetailsViewController"]){
        
        UITableViewCell *tappedCell = sender;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
        
        Post *postToSend = self.feedArray[indexPath.row];
        
        DetailsViewController *detailsViewController = [segue destinationViewController];
        
        detailsViewController.post = postToSend;
        
    }
    
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell" forIndexPath:indexPath];
    Post *message = self.feedArray[indexPath.row];
    cell.post = message;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feedArray.count;
}



- (IBAction)onTapLogoutButton:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        appDelegate.window.rootViewController = loginViewController;
        //[self dismissViewControllerAnimated:true completion:nil];
        // PFUser.current() will now be nil
    }];
}


- (IBAction)onTappictureButton:(id)sender {
}
@end
