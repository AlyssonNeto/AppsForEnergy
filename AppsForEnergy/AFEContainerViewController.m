//
//  AFEContainerViewController.m
//  AppsForEnergy
//
//  Created by Tim Leytens on 18/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "AFEContainerViewController.h"
#import "AFEInfoViewController.h"
#import "AFEStep1ViewController.h"
#import "AFEStep2ViewController.h"
#import "AFEStep3ViewController.h"
#import "AFEResultsViewController.h"

@interface AFEContainerViewController ()

@property (nonatomic, strong) UIViewController *rootViewController;

@end

@implementation AFEContainerViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super init];
    if (self) {
        self.rootViewController = rootViewController;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"E-ZON";

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];

    if ([self.childViewControllers count] == 0) {
        [self.rootViewController willMoveToParentViewController:self];
        [self addChildViewController:self.rootViewController];

        UIView *rootView = self.rootViewController.view;
        rootView.frame = self.view.bounds;
        [self.view addSubview:rootView];
        [self.rootViewController didMoveToParentViewController:self];
    }

    UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [homeButton setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [homeButton setFrame:CGRectMake(0, 0, 24, 24)];
    [homeButton addTarget:self
                   action:@selector(startAgain:)
         forControlEvents:UIControlEventTouchDown];

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    self.navigationItem.leftBarButtonItem = item;

    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [infoButton setImage:[UIImage imageNamed:@"info.png"] forState:UIControlStateNormal];
    [infoButton setFrame:CGRectMake(0, 0, 24, 24)];
    [infoButton addTarget:self
                   action:@selector(infoModal:)
         forControlEvents:UIControlEventTouchDown];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];

    self.navigationItem.rightBarButtonItem = rightItem;

}

- (void)switchViewController:(NSString *)viewControllerIdentifier
{

    Class ViewControllerClass = NSClassFromString(viewControllerIdentifier);
    UIViewController *viewController = [[ViewControllerClass alloc] initWithNibName:nil bundle:nil];

    [viewController willMoveToParentViewController:self];
    [self addChildViewController:viewController];

    [self.view addSubview:viewController.view];

    [self.rootViewController willMoveToParentViewController:nil];

    [self transitionFromViewController:self.rootViewController
                      toViewController:viewController
                              duration:0.3
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{

                            }
                            completion:^(BOOL finished){
                                [self.rootViewController.view removeFromSuperview];
                                [self.rootViewController removeFromParentViewController];
                                self.rootViewController = viewController;
                            }];
}

-(void)startAgain:(UIButton *)sender {

    _afeValues = nil;
    _afeValues = [[AFEValues alloc] init];
    [self switchViewController:@"AFEStep1ViewController"];
}

-(void)infoModal:(UIButton *)sender {

    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithNibName:nil bundle:NULL];
    navigationViewController.navigationBar.tintColor = [UIColor whiteColor];
    navigationViewController.navigationBar.barTintColor = UIColorFromRGB(0xb50041);
    navigationViewController.navigationBar.translucent = NO;
    navigationViewController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];

    AFEInfoViewController *VC = [[AFEInfoViewController alloc] initWithNibName:nil bundle:NULL];

    [navigationViewController setViewControllers:@[VC]];

    [self presentViewController:navigationViewController animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation UIViewController (PageContainer)

- (AFEContainerViewController *)pageContainer {
    return (AFEContainerViewController *)self.parentViewController;
}

@end

