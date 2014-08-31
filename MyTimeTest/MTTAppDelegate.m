//
//  MTTAppDelegate.m
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import "MTTAppDelegate.h"
#import "MTTConstants.h"

@interface MTTAppDelegate ()

@property (nonatomic, strong) CLLocationManager* locationManager;

@end

@implementation MTTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

   // Set up some appearances
   
   UIFont* museoSans100 = [UIFont fontWithName:[MTTConstants navBarTitleFontName] size:18];
   [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: museoSans100,
                                                          NSForegroundColorAttributeName : [MTTConstants textColor]}];
   
   [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init]
                                      forBarMetrics:UIBarMetricsDefault];
   [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
   
   UITextField* searchBarProxy = [UITextField appearanceWhenContainedIn:[UISearchBar class], nil];
   
   [searchBarProxy setFont:[UIFont fontWithName:[MTTConstants placeholderTextFontName]
                                           size:16.0]];
   [searchBarProxy setTextColor:[MTTConstants textColor]];
   
   // Set a default location to be used if none other can be found
   self.lastLocation = [[CLLocation alloc] initWithLatitude:34.052200 longitude:-118.242800];

   // Set up core location manager
   self.locationManager = [[CLLocationManager alloc] init];
   self.locationManager.delegate = self;
   self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
   
   [self.locationManager startUpdatingLocation];
   
   return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
   // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
   // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

+ (instancetype)sharedDelegate
{
   return (MTTAppDelegate*)[[UIApplication sharedApplication] delegate];
}

#pragma CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
   // Got one! We're good.
   self.lastLocation = locations.firstObject;
   
   [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
   NSLog(@"Location Manager failed. Error: %@", error);
}

@end
