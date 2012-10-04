//
//  iLaptonFifthViewController.m
//  iLapton
//
//  Created by Raynard on 10/3/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLaptonFifthViewController.h"
#import "iLaptonThirdViewController.h"
#import "iLaptonViewController.h"



@implementation iLaptonFifthViewController

@synthesize lbl_finalLabel1;
@synthesize lbl_finalLabel2;
@synthesize lbl_topScoreTitle;
@synthesize btn_NewGameSameName, btn_NewGameDiffName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // hide Back button
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    int language = [prefs integerForKey:@"language"];
    NSString *playerName_string = [prefs stringForKey:@"PlayerName"];
    NSString *playerScore_string = [prefs stringForKey:@"FINALSCORE"];
    

    
    // label - top 5
    lbl_topScoreTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 300, 40) ];
    lbl_topScoreTitle.textAlignment =  UITextAlignmentCenter;
    lbl_topScoreTitle.textColor = [UIColor redColor];
    lbl_topScoreTitle.backgroundColor = [UIColor clearColor];
    lbl_topScoreTitle.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(16.0)];
    [self.view addSubview:lbl_topScoreTitle];
    
    
    if (language == 1) {
        [self setTitle:@"Results"];
        lbl_finalLabel1.text = [NSString stringWithFormat: @"Congratulations, %@", playerName_string];
        lbl_finalLabel2.text = [NSString stringWithFormat: @"Your score is: %@", playerScore_string];
        lbl_topScoreTitle.text = @"TOP 5 Score:";

    } else {
        [self setTitle:@"Hola hola"];
        lbl_finalLabel1.text = [NSString stringWithFormat: @"Felicidades, %@", playerName_string];
        lbl_finalLabel2.text = [NSString stringWithFormat: @"Su puntuación es: %@", playerScore_string];
        lbl_topScoreTitle.text = @"Hola cerveza llamo chica:";

    }
    
    
    
    // New Game - Same User Info
    btn_NewGameSameName = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_NewGameSameName addTarget:self action:@selector(btnNewGameSameName:) forControlEvents:UIControlEventTouchUpInside];
    [btn_NewGameSameName setTitle:@"Start new game (same user info)" forState:UIControlStateNormal];
    btn_NewGameSameName.frame = CGRectMake(35.0, 250.0, 120.0, 60.0);
    btn_NewGameSameName.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
    [self.view addSubview:btn_NewGameSameName];

    // New Game - New User Info
    btn_NewGameDiffName = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_NewGameDiffName addTarget:self action:@selector(btnNewGameNewName:) forControlEvents:UIControlEventTouchUpInside];
    [btn_NewGameDiffName setTitle:@"Start new game (new user info)" forState:UIControlStateNormal];
    btn_NewGameDiffName.frame = CGRectMake(165.0, 250.0, 120.0, 60.0);
    btn_NewGameDiffName.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
    [self.view addSubview:btn_NewGameDiffName];
   
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)btnNewGameSameName:(id)sender {
    
   
    //i don´t understand this part (saul). i think it´s only to go to the next screen
    iLaptonThirdViewController *thirdViewController = [[iLaptonThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdViewController animated:YES];
    
}

-(void)btnNewGameNewName:(id)sender {
    
    
    //i don´t understand this part (saul). i think it´s only to go to the next screen
    iLaptonViewController *firstViewController = [[iLaptonViewController alloc] init];
    [self.navigationController pushViewController:firstViewController animated:YES];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
