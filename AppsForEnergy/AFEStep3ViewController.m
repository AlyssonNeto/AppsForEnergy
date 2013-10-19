//
//  AFEStep3ViewController.m
//  AppsForEnergy
//
//  Created by Tim Leytens on 19/10/13.
//  Copyright (c) 2013 Tim Leytens. All rights reserved.
//

#import "AFEStep3ViewController.h"
#import "AFEContainerViewController.h"

#define kUpdateInterval (1.0f / 60.0f)


@interface AFEStep3ViewController ()

@property (assign, nonatomic) CMAcceleration acceleration;
@property (strong, nonatomic) CMMotionManager  *motionManager;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property(readonly, nonatomic) CLLocationDirection trueHeading;

@end

@implementation AFEStep3ViewController

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

    _againBtn.alpha = 0;
    _nextBtn.alpha = 0;

    [_nextBtn setType:BButtonTypeWarning];
    _nextBtn.color = UIColorFromRGB(0xb50041);
    _nextBtn.frame = CGRectMake(_nextBtn.frame.origin.x - 20, _nextBtn.frame.origin.y - 20, _nextBtn.frame.size.width + 20, _nextBtn.frame.size.height + 20);

    [_startBtn setType:BButtonTypeWarning];
    _startBtn.color = UIColorFromRGB(0xb50041);
    _startBtn.frame = CGRectMake(_startBtn.frame.origin.x, _startBtn.frame.origin.y - 20, _startBtn.frame.size.width + 20, _startBtn.frame.size.height + 20);

    [_againBtn setType:BButtonTypeWarning];
    _againBtn.color = UIColorFromRGB(0xb50041);
    _againBtn.frame = CGRectMake(_againBtn.frame.origin.x, _againBtn.frame.origin.y - 20, _againBtn.frame.size.width + 20, _againBtn.frame.size.height + 20);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextStep:(UIButton *)sender {
        [self.pageContainer switchViewController:@"AFEResultsViewController"];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {

    CGFloat currentHeading = newHeading.magneticHeading;
    NSString *strDirection = [[NSString alloc] init];

    currentHeading = (((int)currentHeading + 180) % (int)360);

    int effecientie = 0;

    if(currentHeading >23 && currentHeading <= 67){
        strDirection = @"NE";

    } else if(currentHeading >68 && currentHeading <= 112){
        strDirection = @"E";
        if ([self.pageContainer.afeValues.hellingsgraad intValue] < 30) {
            effecientie = 94;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 30 && [self.pageContainer.afeValues.hellingsgraad intValue] < 60) {
            effecientie = 91;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 60 && [self.pageContainer.afeValues.hellingsgraad intValue] < 90) {
            effecientie = 79;
        }
        else {
            effecientie = 56;
        }
    } else if(currentHeading >113 && currentHeading <= 167){
        strDirection = @"SE";
        if ([self.pageContainer.afeValues.hellingsgraad intValue] < 30) {
            effecientie = 94;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 30 && [self.pageContainer.afeValues.hellingsgraad intValue] < 60) {
            effecientie = 97;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 60 && [self.pageContainer.afeValues.hellingsgraad intValue] < 90) {
            effecientie = 89;
        }
        else {
            effecientie = 67;
        }

    } else if(currentHeading >168 && currentHeading <= 202){
        strDirection = @"S";
        if ([self.pageContainer.afeValues.hellingsgraad intValue] < 30) {
            effecientie = 94;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 30 && [self.pageContainer.afeValues.hellingsgraad intValue] < 60) {
            effecientie = 100;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 60 && [self.pageContainer.afeValues.hellingsgraad intValue] < 90) {
            effecientie = 92;
        }
        else {
            effecientie = 69;
        }

    } else if(currentHeading >203 && currentHeading <= 247){
        strDirection = @"SW";
        if ([self.pageContainer.afeValues.hellingsgraad intValue] < 30) {
            effecientie = 94;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 30 && [self.pageContainer.afeValues.hellingsgraad intValue] < 60) {
            effecientie = 97;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 60 && [self.pageContainer.afeValues.hellingsgraad intValue] < 90) {
            effecientie = 89;
        }
        else {
            effecientie = 67;
        }

    } else if(currentHeading >248 && currentHeading <= 293){
        strDirection = @"W";
        if ([self.pageContainer.afeValues.hellingsgraad intValue] < 30) {
            effecientie = 94;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 30 && [self.pageContainer.afeValues.hellingsgraad intValue] < 60) {
            effecientie = 91;
        }
        else if ([self.pageContainer.afeValues.hellingsgraad intValue] >= 60 && [self.pageContainer.afeValues.hellingsgraad intValue] < 90) {
            effecientie = 79;
        }
        else {
            effecientie = 56;
        }

    } else if(currentHeading >294 && currentHeading <= 337){
        strDirection = @"NW";

    } else if(currentHeading >=338 || currentHeading <= 22){

        strDirection = @"N";
    }

    _richting.text = [NSString stringWithFormat:@"%@", strDirection];
    _efficientie.text = [NSString stringWithFormat:@"%d%%", effecientie];

    self.pageContainer.afeValues.hellingsgraad = [NSNumber numberWithInt:currentHeading];

    [self.locationManager stopUpdatingLocation];
    _locationManager = nil;

}


- (IBAction)measureAgain:(UIButton *)sender {
    _nextBtn.alpha = 0;
    _againBtn.alpha = 0;
    _startBtn.alpha = 1;

    [self startMeasuring:nil];
}

- (IBAction)startMeasuring:(UIButton *)sender {

    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    _locationManager.headingFilter = 0.5;
    [_locationManager startUpdatingHeading];

    self.motionManager = [[CMMotionManager alloc]  init];
    self.queue         = [[NSOperationQueue alloc] init];

    self.motionManager.accelerometerUpdateInterval = kUpdateInterval;

    [self.motionManager startAccelerometerUpdatesToQueue:self.queue withHandler:
     ^(CMAccelerometerData *accelerometerData, NSError *error) {
         [(id) self setAcceleration:accelerometerData.acceleration];

         CGFloat angle = atan2(self.acceleration.y, self.acceleration.z) + M_PI_2;
         CGFloat angleDegrees = ((float)angle * 180.0f / M_PI) + 360.0f;
         angleDegrees = (((int)angleDegrees + 90) % (int)360);

         if (angleDegrees > 180) {
             angleDegrees = 360 - angleDegrees;
         }
         [self.motionManager stopAccelerometerUpdates];

         if(![NSThread isMainThread])
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 _helling.text = [NSString stringWithFormat:@"%.0f °", angleDegrees];
                 self.pageContainer.afeValues.hellingsgraad = [NSNumber numberWithInt:angleDegrees];
                 _nextBtn.alpha = 1;
                 _againBtn.alpha = 1;
                 _startBtn.alpha = 0;

             });
         }
     }];
}

@end
