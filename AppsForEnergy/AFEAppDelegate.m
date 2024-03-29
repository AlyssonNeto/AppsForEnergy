//
//  AFEAppDelegate.m
//  AppsForEnergy
//
//  Created by Tim Leytens on 18/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "AFEAppDelegate.h"
#import "AFEContainerViewController.h"
#import "AFEStep1ViewController.h"

@implementation AFEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithNibName:nil bundle:NULL];
    navigationViewController.navigationBar.tintColor = [UIColor whiteColor];
    navigationViewController.navigationBar.barTintColor = UIColorFromRGB(0xb50041);
    navigationViewController.navigationBar.translucent = NO;
    navigationViewController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];


    AFEStep1ViewController *step1ViewController = [[AFEStep1ViewController alloc] initWithNibName:nil bundle:NULL];

    AFEContainerViewController *containerViewController = [[AFEContainerViewController alloc] initWithRootViewController:step1ViewController];

    [navigationViewController setViewControllers:@[containerViewController]];

	self.window.rootViewController = navigationViewController;

    return YES;
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
