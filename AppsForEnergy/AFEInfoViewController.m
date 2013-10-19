//
//  AFEInfoViewController.m
//  AppsForEnergy
//
//  Created by Tim Leytens on 19/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "AFEInfoViewController.h"

@interface AFEInfoViewController ()

@end

@implementation AFEInfoViewController

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
    [super viewDidLoad];

    self.title = @"Over E-ZON";

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [closeButton setFrame:CGRectMake(0, 0, 24, 24)];
    [closeButton addTarget:self
                   action:@selector(closeModal:)
         forControlEvents:UIControlEventTouchDown];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];

    self.navigationItem.rightBarButtonItem = rightItem;

}

-(void)closeModal:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
