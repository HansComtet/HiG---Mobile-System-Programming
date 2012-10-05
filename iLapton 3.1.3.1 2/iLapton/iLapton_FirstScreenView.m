//
//  iLapton_FirstScreenView.m
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLapton_FirstScreenView.h"

@implementation iLapton_FirstScreenView

@synthesize textField_YourName, btn_Next, btn_Skip, segmentedControl;

- (id)initWithFrame:(CGRect)frame:(UIViewController *)parent
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
         
        // Textfield for name
        textField_YourName = [[UITextField alloc] initWithFrame:CGRectMake(35, 40, 200, 40)];
        textField_YourName.borderStyle = UITextBorderStyleRoundedRect;
        textField_YourName.font = [UIFont systemFontOfSize:15];
        textField_YourName.placeholder = @"Type your name here";
        textField_YourName.autocorrectionType = UITextAutocorrectionTypeNo;
        textField_YourName.keyboardType = UIKeyboardTypeDefault;
        textField_YourName.returnKeyType = UIReturnKeyDone;
        textField_YourName.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField_YourName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        //textField_YourName.delegate = self;
        
        // show keyboard after loading screen
        [textField_YourName becomeFirstResponder];
        
        [self addSubview:textField_YourName];
        
        // Skip button
        btn_Skip = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn_Skip addTarget:parent action:@selector(btnSkip:) forControlEvents:UIControlEventTouchUpInside];
        [btn_Skip setTitle:@"Skip" forState:UIControlStateNormal];
        btn_Skip.frame = CGRectMake(35.0, 120.0, 80.0, 60.0);
        [self addSubview:btn_Skip];
        
        
        // Next button
        btn_Next = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn_Next addTarget:parent action:@selector(btnNext:) forControlEvents:UIControlEventTouchUpInside];
        [btn_Next setTitle:@"Next" forState:UIControlStateNormal];
        btn_Next.frame = CGRectMake(140.0, 120.0, 160.0, 60.0);
        [self addSubview:btn_Next];

        
        // lang seg control
        NSArray *itemArray = [NSArray arrayWithObjects: @"EN", @"ES", nil];
        segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
        segmentedControl.frame = CGRectMake(225, 35, 100, 50);
        segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
        segmentedControl.selectedSegmentIndex = 1;
        segmentedControl.transform = CGAffineTransformMakeRotation(M_PI / 2.0);
        [segmentedControl addTarget:parent action:@selector(langChanged:) forControlEvents:UIControlEventValueChanged];
        segmentedControl.selectedSegmentIndex = 0;
        [self addSubview:segmentedControl];
        
        
        // rotate labels in seg control (lang)
        NSArray *arr = [segmentedControl subviews];
        for (int i = 0; i < [arr count]; i++) {
            
            UIView *v = (UIView*) [arr objectAtIndex:i];
            NSArray *subarr = [v subviews];
            for (int j = 0; j < [subarr count]; j++) {
                
                if ([[subarr objectAtIndex:j] isKindOfClass:[UILabel class]]) {
                    UILabel *l = (UILabel*) [subarr objectAtIndex:j];
                    l.transform = CGAffineTransformMakeRotation(- M_PI / 2.0); //do the reverse of what Ben did
                }
                
            }
        }
    }
    return self;
}

@end
