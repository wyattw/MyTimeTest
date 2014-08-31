//
//  MTTLocation.m
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/30/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import "MTTLocation.h"

#import <CoreLocation/CoreLocation.h>

@implementation MTTLocation

- (instancetype)initWithArchive:(NSDictionary *)archive
{
   self = [super init];
   
   if (self) {
      self.streetAddress1 = archive[@"street_address"];
      self.streetAddress2 = archive[@"street_address_2"];
      self.city = archive[@"city"];
      self.state = archive[@"state"];
      
      self.phoneNumber = archive[@"phone_number"];
   
      self.neighborhoods = archive[@"neighborhoods"];
   }

   return self;
}

- (void)setLocationWithLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude
{
   self.location = [[CLLocation alloc] initWithLatitude:latitude
                                              longitude:longitude];
}

@end

@implementation MTTCompanyLocation

- (instancetype)initWithArchive:(NSDictionary *)archive
{
   self = [super initWithArchive:archive];
   
   if (self) {
      self.locationID = [archive[@"id"] unsignedIntegerValue];
      
      self.primary = [archive[@"primary"] boolValue];
      self.mobileNumber = archive[@"mobile_number"];
      self.zip = archive[@"zip_code"];
      
      [self setLocationWithLatitude:[archive[@"lat"] doubleValue]
                          longitude:[archive[@"lng"] doubleValue]];
   }
   
   return self;
}

@end

@implementation MTTSearchResultLocation

- (instancetype)initWithArchive:(NSDictionary *)archive
{
   self = [super initWithArchive:archive];
   
   if (self) {
      self.locationID = [archive[@"location_id"] unsignedIntegerValue];
      self.zip = archive[@"zip"];
      
      NSDictionary* locationArchive = archive[@"location"];
      [self setLocationWithLatitude:[locationArchive[@"lat"] doubleValue]
                          longitude:[locationArchive[@"lon"] doubleValue]];
   }
   
   return self;
}

@end