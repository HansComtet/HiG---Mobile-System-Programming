//
//  iLaptonFifthViewController.h
//  iLapton
//
//  Created by Raynard on 10/3/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface iLaptonFifthViewController : UIViewController{
    
    IBOutlet UILabel *lbl_finalLabel2;
    IBOutlet UILabel *lbl_finalLabel1;
    
    
}


@property (nonatomic, retain) UILabel *lbl_finalLabel1;
@property (nonatomic, retain) UILabel *lbl_finalLabel2;


@property (nonatomic, retain) UILabel *lbl_topScoreTitle;

@property (nonatomic, retain) UIButton *btn_NewGameSameName;
@property (nonatomic, retain) UIButton *btn_NewGameDiffName;




@end
