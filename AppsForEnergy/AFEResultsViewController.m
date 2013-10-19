//
//  AFEResultsViewController.m
//  AppsForEnergy
//
//  Created by Tim Leytens on 19/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "AFEResultsViewController.h"

@interface AFEResultsViewController ()

@end

@implementation AFEResultsViewController

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

    [_subsidies setType:BButtonTypeWarning];
    _subsidies.color = UIColorFromRGB(0xb50041);
    _subsidies.frame = CGRectMake(_subsidies.frame.origin.x, _subsidies.frame.origin.y + 20, 240, _subsidies.frame.size.height + 20);

    [_infoBtn setType:BButtonTypeWarning];
    _infoBtn.color = UIColorFromRGB(0xb50041);
    _infoBtn.frame = CGRectMake(_infoBtn.frame.origin.x, _subsidies.frame.origin.y + 20 + _subsidies.frame.size.height, 240 , _infoBtn.frame.size.height + 20);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
