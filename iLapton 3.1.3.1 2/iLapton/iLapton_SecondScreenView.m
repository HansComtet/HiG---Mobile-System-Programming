//
//  iLapton_SecondScreenView.m
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLapton_SecondScreenView.h"

@implementation iLapton_SecondScreenView

@synthesize imagePicker;
@synthesize lbl_infoPlayer, lbl_welcomePlayer;

- (id)initWithFrame:(CGRect)frame:(UIViewController *)parent
{
    
    NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
    int language = [lang integerForKey:@"language"];
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        [self setBackgroundColor:[UIColor blackColor]];
        
        // label - info
        lbl_infoPlayer = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 40) ];
        lbl_infoPlayer.textAlignment =  UITextAlignmentCenter;
        lbl_infoPlayer.textColor = [UIColor blueColor];
        lbl_infoPlayer.backgroundColor = [UIColor clearColor];
        lbl_infoPlayer.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(10.0)];
        [self addSubview:lbl_infoPlayer];
        
        if (language == 1) {
            lbl_infoPlayer.text = @"Let's take photo of your face:";
        } else {
            lbl_infoPlayer.text = @"Tomemos una foto de su cara:";
        }
        

        
        // label - welcome <PLAYER_NAME> msg
        lbl_welcomePlayer = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 40) ];
        lbl_welcomePlayer.textAlignment =  UITextAlignmentCenter;
        lbl_welcomePlayer.textColor = [UIColor whiteColor];
        lbl_welcomePlayer.backgroundColor = [UIColor clearColor];
        lbl_welcomePlayer.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(24.0)];
        [self addSubview:lbl_welcomePlayer];
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *playerName_string = [prefs stringForKey:@"PlayerName"];
        

        if (language == 1) {
            lbl_welcomePlayer.text = [NSString stringWithFormat: @"Hi, %@", playerName_string];
        } else {
            lbl_welcomePlayer.text = [NSString stringWithFormat: @"Hola, %@", playerName_string];
        }
        
        // Camera controller
        imagePicker = [[iLaptonSecondViewController_ImagePicker alloc] init];
        imagePicker.secondViewController = parent;
        
        // Set source to the camera
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
            // use front camera
            imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            // flip mirrored image
            imagePicker.cameraViewTransform = CGAffineTransformScale(imagePicker.cameraViewTransform, -1, 1);

        } else {
            
            imagePicker.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            
        }
        
        // Show image picker       
        [self addSubview:imagePicker.view];
        
        
    }
    
    return self;
    
}

@end
