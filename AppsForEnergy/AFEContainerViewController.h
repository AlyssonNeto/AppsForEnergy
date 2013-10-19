//
//  AFEContainerViewController.h
//  AppsForEnergy
//
//  Created by Tim Leytens on 18/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFEValues.h"

@interface AFEContainerViewController : UIViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController;

- (void)switchViewController:(NSString *)viewControllerIdentifier;

@property (nonatomic, strong) AFEValues *afeValues;

@end

@interface UIViewController (PageContainer)

@property (nonatomic, readonly) AFEContainerViewController *pageContainer;

@end