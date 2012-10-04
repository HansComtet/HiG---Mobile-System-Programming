//
//  iLaptonFourthViewController2.h
//  iLapton
//
//  Created by Raynard on 10/1/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "iLaptonFifthViewController.h"

@interface iLaptonFourthViewController2 : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    
    //Picker View
    UIPickerView *picker;
    NSMutableArray *data1;
    NSMutableArray *data2;
    NSMutableArray *data3;
    NSMutableArray *data4;
    NSMutableArray *data5;


    // Light
    UIButton *onButton;
    UIButton *offButton;
    UIImageView *onView;
    UIImageView *offView;
    //NSString *string_aux_1;
   // NSString *string_aux_2;
   // NSString *string_aux_3;
   // NSString *string_aux_4;
   // NSString *string_aux_5;

    int counter;
    
    // How many times it is blinking THE LED (6 seqencies totally).
    int maxBlink1;
    int maxBlink2;
    int maxBlink3;
    int maxBlink4;
    int maxBlink5;

    //NSNumber *maxBlink1_num;
    //NSNumber *maxBlink2_num;
    //NSNumber *maxBlink3_num;
    //NSNumber *maxBlink4_num;
    //NSNumber *maxBlink5_num;
    NSNumber *finalScore_num;




    NSNumber *counter2;
    NSNumber *score;
    UIButton *check;


    NSTimer *blinkCicle;
    float freq;
    float freq2;
    float freq3;
    
    int isCalledTimes; // ES LO MISMO QUE "COMPONENT"
    
    int penaltyPoints; // after pressing again button more times
    
    
    int score1;
    int score2;
    int score3;
    int score4;
    int score5;
    int finalScore;
    
}

// label - changable top
@property (nonatomic, retain) UILabel *lbl_info;
// label - counting sequencies
@property (nonatomic, retain) UILabel *lbl_sequency;
@property (nonatomic, retain) UILabel *lbl_sequency_nr;


// progress bar before playing
@property (nonatomic, strong) UIProgressView *progressBar;



//Picker
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
//@property (nonatomic, strong) NSString *string_aux;
//@property (nonatomic, strong) NSNumber *maxBlink2;
@property (nonatomic, strong) NSNumber *counter2;
@property (nonatomic, strong) NSNumber *score;
@property (nonatomic, retain) NSArray *data1;
@property (nonatomic, retain) NSArray *data2;
@property (nonatomic, retain) NSArray *data3;
@property (nonatomic, retain) NSArray *data4;
@property (nonatomic, retain) NSArray *data5;




// Code to import user_nick (future)
@property (nonatomic, retain) UILabel *user_nick;

//Light
@property (strong, nonatomic) IBOutlet UIButton *onButton;
@property (strong, nonatomic) IBOutlet UIButton *offButton;
@property (strong, nonatomic) IBOutlet UIButton *check;
@property (strong, nonatomic) IBOutlet UIImageView *onView;
@property (strong, nonatomic) IBOutlet UIImageView *offView;

// Timer
@property (strong, nonatomic) NSTimer *timer;

// button - play again (again blink LED and play sound)
@property (nonatomic, retain) UIButton *btn_Again;

//Change the screen
@property (nonatomic, retain) iLaptonFifthViewController *fifthScreenView;

@property (nonatomic, retain) iLaptonFourthViewController2 *fourthScreenView;


-(IBAction)start;
-(IBAction)finish;
-(IBAction)checkAction;




@end
