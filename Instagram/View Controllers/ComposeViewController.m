//
//  ComposeViewController.m
//  Instagram
//
//  Created by Katie Kwan on 7/10/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import "ComposeViewController.h"
#import "Parse.h"
#import "Post.h"


@interface ComposeViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *captionText;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) UIImage *picture;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *takeAPictureButton;
@property (weak, nonatomic) IBOutlet UIButton *cameraRollButton;




@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    //UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    self.postImage.image = nil;
    self.postImage.image = editedImage;
    self.picture = editedImage;
    CGSize size = CGSizeMake(250, 250);
    self.picture = [self resizeImage:self.picture withSize:size];
   
    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)onTapTakePicture:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    // Do any additional setup after loading the view.
    
}

- (IBAction)onTapCameraRoll:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}


- (IBAction)onTapCancelButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)onTapShareButton:(id)sender {
    [Post postUserImage: self.picture withCaption: self.captionText.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        
    }];
    

    [self dismissViewControllerAnimated:true completion:nil];
}
@end
