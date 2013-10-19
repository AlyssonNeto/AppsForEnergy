//
//  AFEStep1ViewController.m
//  AppsForEnergy
//
//  Created by Tim Leytens on 18/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "AFEStep1ViewController.h"
#import "AFEContainerViewController.h"

@interface AFEStep1ViewController ()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation AFEStep1ViewController

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

    [_nextBtn setType:BButtonTypeWarning];
    _nextBtn.color = UIColorFromRGB(0xb50041);
    _nextBtn.frame = CGRectMake(_nextBtn.frame.origin.x - 50, _nextBtn.frame.origin.y - 20, _nextBtn.frame.size.width + 50, _nextBtn.frame.size.height + 20);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextStep:(UIButton *)sender {
    [self.pageContainer switchViewController:@"AFEStep2ViewController"];
}
@end
