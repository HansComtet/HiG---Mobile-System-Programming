//
//  iLapton_ThirdScreenView.m
//  iLapton
//
//  Created by Mat on 9/28/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLapton_ThirdScreenView.h"

@implementation iLapton_ThirdScreenView

@synthesize user_nick, user_photo, level1_button, level2_button, level3_button, lbl_infoPlayer;

- (id)initWithFrame:(CGRect)frame:(UIViewController *)parent
{
    
    NSUserDefaults *lang = [NSUserDefaults standardUserDefaults];
    int language = [lang integerForKey:@"language"];
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
        
        
        // image - player photo
        user_photo = [[UIImageView alloc] initWithFrame:CGRectMake(18, 30, 80, 60)];
        //obtaining saving path
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:@"photo.png"];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile: imagePath];

        user_photo.image = img;
        float degrees = 90; //the value in degrees
        user_photo.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        
        
        [self addSubview:user_photo];

        // label - info
        lbl_infoPlayer = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 300, 40) ];
        lbl_infoPlayer.textAlignment =  UITextAlignmentLeft;
        lbl_infoPlayer.textColor = [UIColor blackColor];
        lbl_infoPlayer.backgroundColor = [UIColor clearColor];
        lbl_infoPlayer.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(10.0)];
        [self addSubview:lbl_infoPlayer];
        
        if (language == 1) {
            lbl_infoPlayer.text = @"Your name:";
        } else {
            lbl_infoPlayer.text = @"Su nombre:";
        }
        
        
        // label - player nick
        user_nick = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 250, 40) ];
        user_nick.textAlignment =  UITextAlignmentLeft;
        user_nick.textColor = [UIColor whiteColor];
        user_nick.backgroundColor = [UIColor clearColor];
        user_nick.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(24.0)];
        [self addSubview:user_nick];
        
        
        
        // User Button
        level1_button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [level1_button addTarget:parent action:@selector(goToLevel:) forControlEvents:UIControlEventTouchUpInside];
        if (language == 1) {
            [level1_button setTitle:@"Level 1" forState:UIControlStateNormal];
        } else {
            [level1_button setTitle:@"Nivel 1" forState:UIControlStateNormal];
        }
        
        [level1_button setTag:1];
        level1_button.frame = CGRectMake(20, 145, 90,250);
        [self addSubview:level1_button];
 
        
        // User Button
        level2_button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [level2_button addTarget:parent action:@selector(goToLevel:) forControlEvents:UIControlEventTouchUpInside];
        if (language == 1) {
            [level2_button setTitle:@"Level 2" forState:UIControlStateNormal];
        } else {
            [level2_button setTitle:@"Nivel 2" forState:UIControlStateNormal];
        }
        [level2_button setTag:2];
        level2_button.frame = CGRectMake(115, 145, 90,250);
        [self addSubview:level2_button];
        
        // User Button
        level3_button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [level3_button addTarget:parent action:@selector(goToLevel:) forControlEvents:UIControlEventTouchUpInside];
        if (language == 1) {
            [level3_button setTitle:@"Level 3" forState:UIControlStateNormal];
        } else {
            [level3_button setTitle:@"Nivel 3" forState:UIControlStateNormal];
        }
        [level3_button setTag:3];
        level3_button.frame = CGRectMake(210, 145, 90,250);
        [self addSubview:level3_button];
        
                       
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *playerName_string = [prefs stringForKey:@"PlayerName"];
        
        user_nick.text = [NSString stringWithFormat: @"%@", playerName_string];

        
        
        

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
