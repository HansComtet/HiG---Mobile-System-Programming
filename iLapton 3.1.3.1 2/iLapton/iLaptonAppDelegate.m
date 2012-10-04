//
//  iLaptonAppDelegate.m
//  iLapton
//
//  Created by Mat on 9/26/12.
//  Copyright (c) 2012 Mat. All rights reserved.
//

#import "iLaptonAppDelegate.h"

#import "iLaptonViewController.h"

@implementation iLaptonAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Creating first screen (content)
    self.viewController = [[iLaptonViewController alloc] init];

    // Creating navigationController (hierarchy of screens) and init it with first screen
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];

    //[self.window addSubview:navigationController.view];
    [self.window setRootViewController:navigationController];

    // Override point for customization after application launch.
    //self.window.rootViewController = self.viewController;
    return YES;
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    for (UINavigationItem *item in navigationController.navigationBar.subviews) {
        if ([[item title] compare:@"Cancel"] == 0) {
            UIButton *button = (UIButton *)item;
            [button setHidden:YES];
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
