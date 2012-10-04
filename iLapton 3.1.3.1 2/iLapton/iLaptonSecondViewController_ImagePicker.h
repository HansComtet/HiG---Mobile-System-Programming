//
//  iLaptonSecondViewController_ImagePicker.h
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iLaptonThirdViewController.h"

@interface iLaptonSecondViewController_ImagePicker : UIImagePickerController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@property (nonatomic, retain) UIViewController *secondViewController;


@property (nonatomic, retain) iLaptonThirdViewController *thirdViewController;


@end
