//
//  iLaptonViewController.m
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLaptonViewController.h"

@implementation iLaptonViewController

@synthesize firstScreenView, secondViewController, thirdViewController;
@synthesize textField_YourName;
@synthesize btn_Next, btn_Skip, segmentedControl, infoScreen;

#pragma mark - View controller methods
- (void)viewDidLoad
{
    
    isInfoAppears = NO;
    
	// Do any additional setup after loading the view, typically from a nib.
    
    // create a variable that save the current language
    NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
    [lang setInteger:1 forKey:@"language"];
    
    [self setTitle:@"The iLapton Game"];

    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    
    firstScreenView = [[iLapton_FirstScreenView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height):self];
    
    

    self.textField_YourName = firstScreenView.textField_YourName;
    self.btn_Next = firstScreenView.btn_Next;
    //This sentence wasn´t in original code. Ask to Roman
    self.btn_Skip = firstScreenView.btn_Skip;

    self.segmentedControl = firstScreenView.segmentedControl;

    
    self.view = firstScreenView;

    
    [super viewDidLoad];

    
    
}


#pragma mark - Main functionality

-(void)showInfo{
    
    if (!isInfoAppears) {
        NSLog(@"hola chica");
    
        infoScreen = [[iLaptonInfoScreen alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [infoScreen setBackgroundColor:[UIColor blackColor]];
        infoScreen.exclusiveTouch = YES;
        [firstScreenView addSubview:infoScreen];
        
        isInfoAppears = YES;
        
        btn_Next.hidden = YES;
        btn_Skip.hidden = YES;
        segmentedControl.hidden = YES;
        textField_YourName.hidden = YES;
        
        //hide keyboard
        [textField_YourName resignFirstResponder];

    }
    else {
        [infoScreen removeFromSuperview];
        isInfoAppears = NO;
        
        btn_Next.hidden = NO;
        btn_Skip.hidden = NO;
        segmentedControl.hidden = NO;
        textField_YourName.hidden = NO;
        
        // show keyboard
        [textField_YourName becomeFirstResponder];

    }
    


    
    
}


-(void)btnNext:(id)sender {
    
    NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
    int language = [lang integerForKey:@"language"];
    
    NSLog(@"Player name: %@", self.textField_YourName.text);
    
    
    if ([self.textField_YourName.text isEqualToString:@""]) {
        
        if (language == 1) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty name"
                                                            message: @"You have to type your nickname!"
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil,nil];
            [alert show];
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nombre vacío"
                                                            message: @"¡Tiene que escribir su nickname!"
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil,nil];
            [alert show];
        }
        
    }
    
    else {
    
        // Saving player name to NSUserDefault
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:self.textField_YourName.text forKey:@"PlayerName"];
        
        secondViewController = [[iLaptonSecondViewController alloc] init];
        [self.navigationController pushViewController:secondViewController animated:YES];
    }

}

-(void)btnSkip:(id)sender {
    
    // saving player name to NSUserDefault
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"iGuy" forKey:@"PlayerName"];
    
    // Change the screen
    thirdViewController = [[iLaptonThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdViewController animated:YES];
    
}

 // Change language variable value when button is pressed
-(void)langChanged:(id)sender {

   // Get language variable value
    NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
    
    int language = [lang integerForKey:@"language"];
    // Change the value depending of the last value
    // If the language is english, change into spanish. Else, change to english.
    if (self.segmentedControl.selectedSegmentIndex == 1) {
        language = 2;
        [lang setInteger:language forKey:@"language"];
        [self setTitle:@"El juego iLaptop"];
        self.textField_YourName.placeholder = @"Escriba su nombre aquí";
        [btn_Skip setTitle:@"Saltar" forState:UIControlStateNormal];
        [btn_Next setTitle:@"Siguiente" forState:UIControlStateNormal];
        
        
    } else {
        
        language = 1;
        [lang setInteger:language forKey:@"language"];
        [self setTitle:@"The iLaptop game"];
        textField_YourName.placeholder = @"Type your name here";
        [btn_Next setTitle:@"Next" forState:UIControlStateNormal];
        [btn_Skip setTitle:@"Skip" forState:UIControlStateNormal];
        
       
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
