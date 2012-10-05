//
//  iLaptonThirdViewController.m
//  iLapton
//
//  Created by Mat on 9/28/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLaptonThirdViewController.h"

@interface iLaptonThirdViewController ()

@end

@implementation iLaptonThirdViewController

@synthesize thirdScreenView, fourthScreenView, thirdScreenViewController, level1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        // Custom initialization
        NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
        int language = [lang integerForKey:@"language"];
        
        if (language == 1) {
            
            [self setTitle:@"Choose level"];
            
        } else {
            
            [self setTitle:@"Escoja nivel"];
            
        }
        
        
        thirdScreenView = [[iLapton_ThirdScreenView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height):self];
        
        
        self.view = thirdScreenView;

    }
    
    return self;
    
}


-(void)goToLevel:(id)sender {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    UIButton *button = (UIButton*)sender;
    
    if (button.tag == 1) { // level 1
        
        [prefs setObject:@"1" forKey:@"Level"];
        
    } else if (button.tag == 2) { // level 2
       
        [prefs setObject:@"2" forKey:@"Level"];
   
    } else if (button.tag == 3) { // level 3
        
        [prefs setObject:@"3" forKey:@"Level"];
    }
    
    fourthScreenView = [[iLaptonFourthViewController2 alloc] init];
    [self.navigationController pushViewController:fourthScreenView animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
