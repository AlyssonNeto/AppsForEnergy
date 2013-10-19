//
//  AFEStep3ViewController.h
//  AppsForEnergy
//
//  Created by Tim Leytens on 19/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreLocation/CoreLocation.h>
#import "BButton.h"

@interface AFEStep3ViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet BButton *againBtn;
@property (weak, nonatomic) IBOutlet BButton *startBtn;
@property (weak, nonatomic) IBOutlet BButton *nextBtn;

@property (weak, nonatomic) IBOutlet UITextField *richting;
@property (weak, nonatomic) IBOutlet UITextField *helling;
@property (weak, nonatomic) IBOutlet UITextField *efficientie;

- (IBAction)nextStep:(UIButton *)sender;

- (IBAction)measureAgain:(UIButton *)sender;

- (IBAction)startMeasuring:(UIButton *)sender;

@end
