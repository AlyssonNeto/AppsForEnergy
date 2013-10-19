//
//  AFEStep2ViewController.h
//  AppsForEnergy
//
//  Created by Tim Leytens on 18/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFEContainerViewController.h"
#import "BButton.h"

@interface AFEStep2ViewController : UIViewController <UITextFieldDelegate>

- (IBAction)nextStep:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet BButton *nextButton;

@property (weak, nonatomic) IBOutlet UITextField *oppervlakte;

@property (weak, nonatomic) IBOutlet UITextField *lengte;

@property (weak, nonatomic) IBOutlet UITextField *breedte;

@end
