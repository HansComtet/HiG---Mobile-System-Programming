//
//  iLapton_SecondScreenView.h
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iLaptonSecondViewController_ImagePicker.h"

@interface iLapton_SecondScreenView : UIView

@property (nonatomic, retain) iLaptonSecondViewController_ImagePicker *imagePicker;

@property (nonatomic, retain) UILabel *lbl_infoPlayer;
@property (nonatomic, retain) UILabel *lbl_welcomePlayer;

- (id)initWithFrame:(CGRect)frame:(UIViewController *)parent;

@end
