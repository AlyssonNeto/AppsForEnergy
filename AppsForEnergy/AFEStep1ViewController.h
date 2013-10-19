//
//  AFEStep1ViewController.h
//  AppsForEnergy
//
//  Created by Tim Leytens on 18/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"

@interface AFEStep1ViewController : UIViewController

- (IBAction)nextStep:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet BButton *nextBtn;

@end
