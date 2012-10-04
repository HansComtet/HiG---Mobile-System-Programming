//
//  iLapton_FirstScreenView.h
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iLapton_FirstScreenView : UIView {

}

@property (nonatomic, retain) UITextField *textField_YourName;
@property (nonatomic, retain) UIButton *btn_Next;
@property (nonatomic, retain) UIButton *btn_Skip;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;


- (id)initWithFrame:(CGRect)frame:(UIViewController *)parent;


@end
