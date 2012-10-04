//
//  iLaptonSecondViewController_ImagePicker.m
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLaptonSecondViewController_ImagePicker.h"

@interface iLaptonSecondViewController_ImagePicker ()

@end

@implementation iLaptonSecondViewController_ImagePicker

@synthesize thirdViewController, secondViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.delegate = self;
        
        [self.view setFrame:CGRectMake(10, 100, 300, 350)];
        
        //self.title = @"Camera picker";
        


        
        
    }
    return self;
}

- (void) imagePickerController:(UIImagePickerController *)picker
 didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSData *imageData = UIImagePNGRepresentation(image);
    
    NSString *imageName = @"photo.png";
    
    // Find the path to the documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // Now we get the full path to the file
    NSString *fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    
    // Write out the data.
    [imageData writeToFile:fullPathToFile atomically:NO];
    
    
    
    /*
    
    //obtaining saving path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:@"latest_photo.png"];
    
    //extracting image from the picker and saving it
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]){
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        NSData *webData = UIImagePNGRepresentation(editedImage);
        [webData writeToFile:imagePath atomically:YES];
    }
     
     */
    
     NSLog(@"photo shooted");
     
    
    thirdViewController = [[iLaptonThirdViewController alloc] init];
    [secondViewController.navigationController pushViewController:thirdViewController animated:YES];
    


}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
