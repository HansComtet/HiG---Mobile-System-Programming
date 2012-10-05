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
    
    // How many times it is blinking THE LED (5 seqencies totally).
    int maxBlink1;
    int maxBlink2;
    int maxBlink3;
    int maxBlink4;
    int maxBlink5;
    int counter;
    int isCalledTimes;
    NSTimer *blinkCicle;

    // Score
    NSNumber *finalScore_num;
    NSNumber *counter2;
    NSNumber *score;
    UIButton *check;    
    float freq;
    float freq2;
    float freq3;
    
    //Score
    int penaltyPoints;     
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
@property (nonatomic, retain) UILabel *lbl_sequence;
@property (nonatomic, retain) UILabel *lbl_sequence_nr;

// progress bar before playing
@property (nonatomic, strong) UIProgressView *progressBar;

//Picker
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
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
@property (strong, nonatomic) IBOutlet UIButton *check;

// Timer
@property (strong, nonatomic) NSTimer *timer;

// Button - play again (again blink LED and play sound)
@property (nonatomic, retain) UIButton *btn_Again;

//Change the screen
@property (nonatomic, retain) iLaptonFifthViewController *fifthScreenView;
@property (nonatomic, retain) iLaptonFourthViewController2 *fourthScreenView;

// Methods that are used.
-(IBAction)start;
-(IBAction)finish;
-(IBAction)checkAction;

@end
