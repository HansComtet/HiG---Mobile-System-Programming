//
//  iLaptonSecondViewController.h
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iLapton_SecondScreenView.h"
#import "iLaptonThirdViewController.h"

@interface iLaptonSecondViewController : UIViewController

// Create new screens in order to be allowed to change the screen. AHAHAHA
@property (nonatomic, retain) iLapton_SecondScreenView *secondScreenView;
@property (nonatomic, retain) iLaptonThirdViewController *thirdViewController;


@end
