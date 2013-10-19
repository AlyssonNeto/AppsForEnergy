//
//  AFEStep2ViewController.m
//  AppsForEnergy
//
//  Created by Tim Leytens on 18/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "AFEStep2ViewController.h"

@interface AFEStep2ViewController ()

@end

@implementation AFEStep2ViewController

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
	// Do any additional setup after loading the view.

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(hideKeyboard)];

    [self.view addGestureRecognizer:tap];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(berekenOppervlakte)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:_lengte];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(berekenOppervlakte)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:_breedte];

    _nextButton.alpha = 0;

    [_nextButton setType:BButtonTypeWarning];
    _nextButton.color = UIColorFromRGB(0xb50041);
    _nextButton.frame = CGRectMake(_nextButton.frame.origin.x - 50, _nextButton.frame.origin.y - 20, _nextButton.frame.size.width + 50, _nextButton.frame.size.height + 20);


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextStep:(UIButton *)sender {

    self.pageContainer.afeValues.breedte = [NSNumber numberWithInt:[_breedte.text intValue]];
    self.pageContainer.afeValues.lengte = [NSNumber numberWithInt:[_lengte.text intValue]];
    [self.pageContainer switchViewController:@"AFEStep3ViewController"];
}

- (IBAction)berekenOppervlakte {

    int oppervlakte = [_lengte.text intValue] * [_breedte.text intValue];

    if (oppervlakte > 0) {
        _oppervlakte.text = [NSString stringWithFormat:@"%d m2", oppervlakte];
        _nextButton.alpha = 1;
    }
    else {
        _oppervlakte.text = @"0 m2";
        _nextButton.alpha = 0;
    }
}

- (IBAction)hideKeyboard {
    [self.view endEditing:YES];
}

@end
