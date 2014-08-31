//
//  MTTAppDelegate.h
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MTTAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

+ (instancetype)sharedDelegate;

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) CLLocation* lastLocation;

@end
