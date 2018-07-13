//
//  CameraViewController.m
//  Instagram
//
//  Created by Katie Kwan on 7/13/18.
//  Copyright © 2018 Katie Kwan. All rights reserved.
//

#import "CameraViewController.h"





@interface CameraViewController ()
@property (weak, nonatomic) IBOutlet UIView *previewView;
@property (weak, nonatomic) IBOutlet UIImageView *captureImageView;
@property (weak, nonatomic) IBOutlet UIButton *pictureButton;
- (IBAction)didTakePhoto:(id)sender;

//@property (nonatomic) AVCaptureSession *session;
//@property (nonatomic) AVCapturePhotoOutput *stillImageOutput;
//@property (nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

//- (void) viewWillAppear:(BOOL)animated {
//
//    // Do any additional setup after loading the view.
//    self.session = [AVCaptureSession new];
//    self.session.sessionPreset = AVCaptureSessionPresetPhoto;
//    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//
//    NSError *error;
//    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:backCamera
//                                                                        error:&error];
//    if (error) {
//        NSLog(@"%@", error.localizedDescription);
//    } else if (self.session && [self.session canAddInput:input]) {
//        [self.session addInput:input];
//        // The remainder of the session setup will go here...
//    }
//}

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

- (IBAction)didTakePhoto:(id)sender {
}
@end
