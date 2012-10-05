//
//  iLaptonThirdViewController.h
//  iLapton
//
//  Created by Mat on 9/28/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iLapton_ThirdScreenView.h"
#import "iLaptonFourthViewController2.h"



@interface iLaptonThirdViewController : UIViewController


@property (nonatomic, retain) UIViewController *thirdScreenViewController;

@property (nonatomic, retain) iLapton_ThirdScreenView *thirdScreenView;

@property (nonatomic, retain) iLaptonFourthViewController2 *fourthScreenView;

@property (nonatomic, retain) UIButton *level1;


@end
