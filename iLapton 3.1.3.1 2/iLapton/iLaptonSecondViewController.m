//
//  iLaptonSecondViewController.m
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLaptonSecondViewController.h"

@implementation iLaptonSecondViewController


@synthesize secondScreenView, thirdViewController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
    int language = [lang integerForKey:@"language"];
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        if (language == 1) {
            [self setTitle:@"Your avatar"];
        } else {
            [self setTitle:@"Su avatar"];
        }
        
        secondScreenView = [[iLapton_SecondScreenView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height):self];
       
        
        self.view = secondScreenView;
        
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
