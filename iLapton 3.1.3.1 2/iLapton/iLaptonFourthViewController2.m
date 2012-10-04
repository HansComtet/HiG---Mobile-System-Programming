//
//  iLaptonFourthViewController2.m
//  iLapton
//
//  Created by Raynard on 10/1/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLaptonFourthViewController2.h"
#import <AudioToolbox/AudioServices.h>
#include <stdlib.h>



@implementation iLaptonFourthViewController2
    
@synthesize data1,data2,data3,data4,data5;
@synthesize counter2, score;
@synthesize picker, lbl_info, lbl_sequency, lbl_sequency_nr, progressBar;
@synthesize btn_Again;

// Change Screen
@synthesize fifthScreenView,fourthScreenView;

// Code to import user_nick (future)
@synthesize user_nick;

// Scores


// Light
@synthesize onButton, offButton, onView, offView, check;

// Timer
@synthesize timer;

// LED ON
-(IBAction)start{
    
    NSLog(@"ON counter: %i | isCalledTimes: %i", counter, isCalledTimes);
    
    AVCaptureDevice *flashLight = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([flashLight isTorchAvailable] && [flashLight isTorchModeSupported:AVCaptureTorchModeOn ])
    {
        BOOL success = [flashLight lockForConfiguration:nil];
        if(success)
        {
            [flashLight setTorchMode:AVCaptureTorchModeOn];
            [flashLight unlockForConfiguration];
        }
    }
    
}

// LED OFF
-(IBAction)finish{
    
    NSLog(@"OFF");
    
    AVCaptureDevice *flashLight = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([flashLight isTorchAvailable] && [flashLight isTorchModeSupported:AVCaptureTorchModeOn ])
    {
        BOOL success = [flashLight lockForConfiguration:nil];
        if(success)
        {
            [flashLight setTorchMode:AVCaptureTorchModeOff];
            [flashLight unlockForConfiguration];
        }
    }
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        blinkCicle = [[NSTimer alloc] init];
        

        
    }
    
    return self;
}

// method for start sequency of blinking LED in different frequencies
-(void) blinkCycleMethod {
    
    
    if (isCalledTimes == 1) {
        [lbl_sequency_nr setText:@"1"];
        blinkCicle = [NSTimer scheduledTimerWithTimeInterval:freq target:self selector:@selector(blinkLED) userInfo:nil repeats:YES];
    }
    
    else if (isCalledTimes == 2) {
        [lbl_sequency_nr setText:@"2"];
        blinkCicle = [NSTimer scheduledTimerWithTimeInterval:freq target:self selector:@selector(blinkLED) userInfo:nil repeats:YES];
    }
    
    else if (isCalledTimes == 3) {
        [lbl_sequency_nr setText:@"3"];
        blinkCicle = [NSTimer scheduledTimerWithTimeInterval:freq target:self selector:@selector(blinkLED) userInfo:nil repeats:YES];
    }    

    else if (isCalledTimes == 4) {
        [lbl_sequency_nr setText:@"4"];
        blinkCicle = [NSTimer scheduledTimerWithTimeInterval:freq target:self selector:@selector(blinkLED) userInfo:nil repeats:YES];
    }
    
    else if (isCalledTimes == 5) {
        [lbl_sequency_nr setText:@"5"];
        blinkCicle = [NSTimer scheduledTimerWithTimeInterval:freq target:self selector:@selector(blinkLED) userInfo:nil repeats:YES];
    }
    
}

-(void) changeNrOfSequence {
    
    if (isCalledTimes == 1) isCalledTimes = 2;
    else if (isCalledTimes == 2) isCalledTimes = 3;
    else if (isCalledTimes == 3) isCalledTimes = 4;
    else if (isCalledTimes == 4) isCalledTimes = 5;

}

-(void) letsStartBlinkingLED {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *number_of_level = [prefs stringForKey:@"Level"];
    
    // This are the values that changes with the level
    counter = 1;


    NSLog(@"maxBlink1: %i", maxBlink1);
    NSLog(@"maxBlink2: %i", maxBlink2);
    NSLog(@"maxBlink3: %i", maxBlink3);
    NSLog(@"maxBlink4: %i", maxBlink4);
    NSLog(@"maxBlink5: %i", maxBlink5);



    
    //HAY QUE CREAR EL NUMERO DE CICLOS DEPENDIENDO DEL NIVEL.
    
    if (number_of_level == @"1") {
        
        freq = 0.8;
        isCalledTimes = 1;
        
        NSLog(@"Start the first sequence in : 0");
        [self blinkCycleMethod];
                
        float takesFirstSeq = (maxBlink1*freq);
        NSLog(@"Start the second sequence in %f", takesFirstSeq);
        [self performSelector:@selector(blinkCycleMethod) withObject:nil afterDelay:(takesFirstSeq + 2)];
        
        float takesSecondSeq = (maxBlink2*freq);
        NSLog(@"Start the third sequence in %f", (takesSecondSeq +takesFirstSeq +4));
        [self performSelector:@selector(blinkCycleMethod) withObject:nil afterDelay:(takesSecondSeq + takesFirstSeq + 4)];

    }
    
    // LEVEL 2
    else if (number_of_level == @"2") {

        freq = 0.5;
        isCalledTimes = 1;
        NSLog(@"Start the first sequence in : 0");
        [self blinkCycleMethod];
        
        float takesFirstSeq = (maxBlink1*freq);
        NSLog(@"Start the second sequence in %f", takesFirstSeq);
        [self performSelector:@selector(blinkCycleMethod) withObject:nil afterDelay:(takesFirstSeq + 2)];
        
        float takesSecondSeq = (maxBlink2*freq);
        NSLog(@"Start the third sequence in %f", (takesSecondSeq +takesFirstSeq +4));
        [self performSelector:@selector(blinkCycleMethod) withObject:nil afterDelay:(takesSecondSeq + takesFirstSeq + 4)];

        float takesThirdSeq = (maxBlink3*freq);
        NSLog(@"Start the fourth sequence in %f", (takesSecondSeq +takesFirstSeq + takesThirdSeq + 6));
        [self performSelector:@selector(blinkCycleMethod) withObject:nil afterDelay:(takesSecondSeq +takesFirstSeq + takesThirdSeq + 6)];
        
    }
         
    // LEVEL 3
    else if (number_of_level == @"3") {

        freq = 0.3;
        isCalledTimes = 1;
        
        NSLog(@"Start the first sequence in : 0");
        [self blinkCycleMethod];
        
        float takesFirstSeq = (maxBlink1*freq);
        NSLog(@"Start the second sequence in %f", takesFirstSeq);
        [self performSelector:@selector(blinkCycleMethod) withObject:nil afterDelay:(takesFirstSeq + 2)];
        
        float takesSecondSeq = (maxBlink2*freq);
        NSLog(@"Start the third sequence in %f", (takesSecondSeq +takesFirstSeq +4));
        [self performSelector:@selector(blinkCycleMethod) withObject:nil afterDelay:(takesSecondSeq + takesFirstSeq + 4)];
        
        float takesThirdSeq = (maxBlink3*freq);
        NSLog(@"Start the fourth sequence in %f", (takesSecondSeq +takesFirstSeq + takesThirdSeq + 6));
        [self performSelector:@selector(blinkCycleMethod) withObject:nil afterDelay:(takesSecondSeq +takesFirstSeq + takesThirdSeq + 6)];
        
        float takesFourthSeq = (maxBlink4*freq);
        NSLog(@"Start the fifth sequence in %f", (takesFourthSeq + takesThirdSeq + takesSecondSeq +takesFirstSeq +8));
        [self performSelector:@selector(blinkCycleMethod) withObject:nil afterDelay:(takesFourthSeq + takesThirdSeq + takesSecondSeq +takesFirstSeq +8)];
        
    }

}


-(void) letsPickingNumbers {
    
    [self.navigationItem setHidesBackButton:NO animated:YES];

    
    NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
    int language = [lang integerForKey:@"language"];
    
    [picker reloadAllComponents];
    
    progressBar.hidden = YES;
    picker.hidden = NO;
    
    if (language == 1) {
        [lbl_info setText:@"Have you counted it?"];
    } else {
        [lbl_info setText:@"Las ha contado?"];
    }
    
    btn_Again.hidden = NO;
    check.hidden = NO;
    lbl_sequency.hidden = YES;
    lbl_sequency_nr.hidden = YES;
    lbl_info.hidden = NO;



}

- (IBAction)checkAction{
    
    NSInteger column1;
    NSInteger column2;
    NSInteger column3;
    NSInteger column4;
    NSInteger column5;


    


    
    
    
    //It depends on the level so..
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *number_of_level = [prefs stringForKey:@"Level"];
    
    
    
    if (number_of_level == @"1") { // LEVEL 1
        
        column1 = [picker selectedRowInComponent:0] + 1;
        column2 = [picker selectedRowInComponent:1] + 1;
        column3 = [picker selectedRowInComponent:2] + 1;

        
        if (column1 == maxBlink1){
            score1 = 33;
        }
        else
            score1 = 0;
        
        
        if (column2 == maxBlink2){
            score2 = 33;
        }
        else
            score2 = 0;
        
    
        if (column3 == maxBlink3){
            score3 = 33;
        }
        else
            score3 = 0;
    

        finalScore = score1 + score2 + score3 - penaltyPoints;
        NSLog(@"finalScore: %i", finalScore);
        if (finalScore == 99) finalScore = 100;
        
    } else if (number_of_level == @"2") { // LEVEL 2
        
        column1 = [picker selectedRowInComponent:0] + 1;
        column2 = [picker selectedRowInComponent:1] + 1;
        column3 = [picker selectedRowInComponent:2] + 1;
        column4 = [picker selectedRowInComponent:3] + 1;

        
        if (column1 == maxBlink1){
            score1 = 25;
        }
        else
            score1 = 0;
        
        
        if (column2 == maxBlink2){
            score2 = 25;
        }
        else
            score2 = 0;
        
        
        if (column3 == maxBlink3){
            score3 = 25;
        }
        else
            score3 = 0;
        
        if (column4 == maxBlink4){
            score4 = 25;
        }
        else
            score4 = 0;
        
        
        finalScore = score1 + score2 + score3 + score4 - penaltyPoints;
        NSLog(@"finalScore: %i", finalScore);

        
    }
    
    // not working yet
    else if (number_of_level == @"3") {
        
        column1 = [picker selectedRowInComponent:0] + 1;
        column2 = [picker selectedRowInComponent:1] + 1;
        column3 = [picker selectedRowInComponent:2] + 1;
        column4 = [picker selectedRowInComponent:3] + 1;
        column5 = [picker selectedRowInComponent:4] + 1;

        if (column1 == maxBlink1){
            score1 = 20;
        }
        else
            score1 = 0;
        
        
        if (column2 == maxBlink2){
            score2 = 20;
        }
        else
            score2 = 0;
        
        
        if (column3 == maxBlink3){
            score3 = 20;
        }
        else
            score3 = 0;
        
        if (column4 == maxBlink4){
            score4 = 20;
        }
        else
            score4 = 0;
        
        if (column5 == maxBlink5){
            score5 = 20;
        }
        else
            score5 = 0;
        
        
        finalScore = score1 + score2 + score3 + score4 + score5 - penaltyPoints;
        NSLog(@"finalScore: %i", finalScore);

        
    }

    
    
    
    
    
    
    
    
    NSLog(@"Final score: %i",finalScore);
    
    
    
    // Allocate finalScore in NSNumber finalScore2
    
    finalScore_num = [[NSNumber alloc] initWithInt:finalScore];
    
    // Store finalScore in NSUserDefaults.
    NSUserDefaults *final_score = [NSUserDefaults standardUserDefaults];
    [final_score setObject:self->finalScore_num forKey:@"FINALSCORE"];
    
    
    fifthScreenView = [[iLaptonFifthViewController alloc] init];
    [self.navigationController pushViewController:fifthScreenView animated:YES];
    NSLog(@"Link ok");
    
}

- (void)viewDidLoad
{
    
    check.hidden = YES;

    NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
    int language = [lang integerForKey:@"language"];

    if(language == 2)
    {
        [check setTitle:@"Comprobar" forState:UIControlStateNormal];
    }

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *number_of_level = [prefs stringForKey:@"Level"];
    
    NSLog(@"Level: %@", number_of_level);
    
    // We have now a number of selected level
    if (number_of_level == @"1") {
        if (language == 1) {
            [self setTitle:@"So Easy"];
        } else {
            [self setTitle:@"Muy fácil"];
        }
        
    }
    else if (number_of_level == @"2") {
        if (language == 1) {
            [self setTitle:@"Medium"];
        } else {
            [self setTitle:@"Medio"];
        }
    }
    else if (number_of_level == @"3") {
        if (language == 1) {
            [self setTitle:@"Killer one"];
        } else {
            [self setTitle:@"Maestro"];
        }

    }
    
    
    data1 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    data2 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    data3 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    data4 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    data5 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    penaltyPoints = 0;
    
    // label - seq info
    lbl_sequency = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, 300, 300) ];
    lbl_sequency.textAlignment =  UITextAlignmentCenter;
    lbl_sequency.textColor = [UIColor whiteColor];
    lbl_sequency.backgroundColor = [UIColor clearColor];
    lbl_sequency.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(24.0)];
    
    if (language == 1) {
        [self.view addSubview:lbl_sequency];
        [lbl_sequency setText:@"Sequency nr."];
    } else {
        [self.view addSubview:lbl_sequency];
        [lbl_sequency setText:@"Sequencia nr."];
    }
    


    // label - seq number
    lbl_sequency_nr = [[UILabel alloc] initWithFrame:CGRectMake(15, 80, 300, 300) ];
    lbl_sequency_nr.textAlignment =  UITextAlignmentCenter;
    lbl_sequency_nr.textColor = [UIColor whiteColor];
    lbl_sequency_nr.backgroundColor = [UIColor clearColor];
    lbl_sequency_nr.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(60.0)];
    [self.view addSubview:lbl_sequency_nr];
    [lbl_sequency_nr setText:@"1"];

    // label - countown info
    lbl_info = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 40) ];
    lbl_info.textAlignment =  UITextAlignmentCenter;
    lbl_info.textColor = [UIColor whiteColor];
    lbl_info.backgroundColor = [UIColor clearColor];
    lbl_info.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(16.0)];
    
    if (language == 1) {
        [lbl_info setText:@"Prepare to fight!"];
    } else {
        
        [lbl_info setText:@"Preparate para jugar!"];
    }
    [self.view addSubview:lbl_info];

    
    // progress bar
    progressBar = [[UIProgressView alloc] initWithFrame:CGRectMake(60, 200, 200, 40)];
    [progressBar setProgressViewStyle:UIProgressViewStyleBar];
    [self.view addSubview: progressBar];

    
    // Again button
    btn_Again = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_Again addTarget:self action:@selector(btnAgain:) forControlEvents:UIControlEventTouchUpInside];
    if (language == 1) {
        [btn_Again setTitle:@"Again" forState:UIControlStateNormal];
    } else {
        [btn_Again setTitle:@"Otra vez" forState:UIControlStateNormal];
    }
    
    btn_Again.frame = CGRectMake(40.0, 330.0, 120.0, 60.0);
    [btn_Again setTag:1];
    [self.view addSubview:btn_Again];

    
    [self btnAgain:nil];
    
    

    [super viewDidLoad];
    
    
}

- (void)blinkLED {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *number_of_level = [prefs stringForKey:@"Level"];
    
    [self start];
    
    if (isCalledTimes == 1) {
        [self performSelector:@selector(finish) withObject:nil afterDelay:0.05];
        
        if (counter >= (maxBlink1)) {
            if([blinkCicle isValid]) [blinkCicle invalidate];
            [self changeNrOfSequence];
            NSLog(@"Invalidate seq 1");
            counter = 0;
            
        }
    }
    
    else if (isCalledTimes == 2) {
        [self performSelector:@selector(finish) withObject:nil afterDelay:0.05];
        
        if (counter >= maxBlink2) {
            if([blinkCicle isValid]) [blinkCicle invalidate];
            [self changeNrOfSequence];
            NSLog(@"Invalidate seq 2");
            counter = 0;
        }
    }
    
    else if (isCalledTimes == 3) {
        [self performSelector:@selector(finish) withObject:nil afterDelay:0.05];
        
        if (counter >= maxBlink3) {
            if([blinkCicle isValid]) [blinkCicle invalidate];
            [self changeNrOfSequence];
            NSLog(@"Invalidate seq 3");
            
            // QUIZAS SOBRA
            if(number_of_level == @"1"){
                
                [self letsPickingNumbers];

            }
            
            counter = 0;
        }
    }
    
    else if (isCalledTimes == 4) {
        [self performSelector:@selector(finish) withObject:nil afterDelay:0.05];
        
        if (counter >= maxBlink4) {
            if([blinkCicle isValid]) [blinkCicle invalidate];
            [self changeNrOfSequence];
            NSLog(@"Invalidate seq 4");
            if(number_of_level == @"2"){
                
                [self letsPickingNumbers];
                
            }
            
            counter = 0;
            
        }
        
    }
    
    else if (isCalledTimes == 5) {
        [self performSelector:@selector(finish) withObject:nil afterDelay:0.05];
        
        if (counter >= maxBlink5) {
            if([blinkCicle isValid]) [blinkCicle invalidate];
            [self changeNrOfSequence];
            NSLog(@"Invalidate seq 5");
            
            if(number_of_level == @"3"){
                
                [self letsPickingNumbers];

            }
            counter = 0;
            
        }
    }
    
    //NSLog(@"counter: %i | isCalledTimes: %i", counter, isCalledTimes);
    
    counter++;
    
}

-(void)btnAgain:(id)sender {
    
    [self.navigationItem setHidesBackButton:YES animated:YES];

    
    NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
    int language = [lang integerForKey:@"language"];
    
    if([blinkCicle isValid]) [blinkCicle invalidate];

    
    // some penalty and play it again
    
    if (language == 1) {
        [lbl_info setText:@"Prepare to fight!"];
    } else {
        
        [lbl_info setText:@"Preparado para luchar!"];
    }    offButton.hidden = YES;
    onButton.hidden = YES; //temp
    picker.hidden = YES;
    btn_Again.hidden = YES;
    check.hidden = YES;
    progressBar.hidden = NO;
    [progressBar setProgress:0.0];
    lbl_sequency.hidden = YES;
    lbl_sequency_nr.hidden = YES;
    [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
    [self performSelector:@selector(letsStartBlinkingLED) withObject:nil afterDelay:3];
    
    
   
    UIButton *button = (UIButton*)sender;
    if (button.tag != 1) { // level 1
        // generate new only if not Again button was pressed (we go here from previous screen)
        maxBlink1 = arc4random() % 9 + 1; // 1 to 10
        maxBlink2 = arc4random() % 9 + 1; // 1 to 10
        maxBlink3 = arc4random() % 9 + 1; // 1 to 10
        maxBlink4 = arc4random() % 9 + 1; // 1 to 10
        maxBlink5 = arc4random() % 9 + 1; // 1 to 10
    }
    else { // we pressed again button - penalty
        penaltyPoints += 10;
    }
    
}


- (void)makeMyProgressBarMoving {
    
    float actual = [progressBar progress];
    if (actual < 1) {
        progressBar.progress = actual + 0.02;
        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(makeMyProgressBarMoving) userInfo:nil repeats:NO];
    } else {
        lbl_sequency.hidden = NO;
        lbl_sequency_nr.hidden = NO;
        check.hidden = YES;
        progressBar.hidden = YES;
        lbl_info.hidden = YES;
    }
}


- (void)viewDidUnload
{
    
    [self setPicker:nil];
    [super viewDidUnload];

}

-(void) viewDidAppear:(BOOL)animated {
    score1 = 0;
    score2 = 0;
    score3 = 0;
    score4 = 0;
    score5 = 0;
    finalScore= 0;
}

-(void) viewDidDisappear:(BOOL)animated {
    
    if([blinkCicle isValid]) [blinkCicle invalidate];

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
}



// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *number_of_level = [prefs stringForKey:@"Level"];
    
    if (number_of_level == @"1") { // LEVEL 1
       return 3;
    }
    else if (number_of_level == @"2") { // LEVEL 2
       return 4;
    }
    else // LEVEL 3
       return 5;
        
}


// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0){
        
        return [data1 count];
        
    }else if (component == 1){
        
        return [data2 count];

    }else if (component == 2){
        
        return [data3 count];
        
    }else if (component == 3){
        
        return [data4 count];
        
    }else if (component == 4){
        
        return [data5 count];
        
    }else{
        
        return 0;
        
    }
    
}

// what is displayed in pickerview
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0){
        
        return [data1 objectAtIndex:row];
        
    }else if (component == 1){
        
        return [data2 objectAtIndex:row];
        
    }else if (component == 2){
        
        return [data3 objectAtIndex:row];
        
    }else if (component == 3){
        
        return [data4 objectAtIndex:row];
        
    }else if (component == 4){
        
        return [data5 objectAtIndex:row];
        
    }else{
    
    return 0;
    
    }
}
    

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    

    
    

        
    
}



@end
