//
//  iLaptonViewController.h
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iLapton_FirstScreenView.h"
#import "iLaptonSecondViewController.h"
#import "iLaptonThirdViewController.h"

@interface iLaptonViewController : UIViewController

@property (nonatomic, retain) iLapton_FirstScreenView *firstScreenView;
@property (nonatomic, retain) UITextField *textField_YourName;
@property (nonatomic, retain) UIButton *btn_Next;
@property (nonatomic, retain) UIButton *btn_Skip;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;


@property (nonatomic, retain) iLaptonSecondViewController *secondViewController;
@property (nonatomic, retain) iLaptonThirdViewController *thirdViewController;

@end
