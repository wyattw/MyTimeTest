//
//  MTTCompany.m
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import "MTTCompany.h"

#import "MTTLocation.h"

@implementation MTTCompany

- (instancetype)initWithArchive:(NSDictionary *)archive
{
   self = [super init];
   
   if (self) {
      // Extract our data from the archive
      self.name = archive[@"name"];
      self.description = archive[@"description"];
      self.learningTrade = archive[@"learning_trade"];
      self.businessDiffs = archive[@"business_diffrences"]; // The typo in the key is how the data returns
      self.whyLove = archive[@"why_love"];
      
      NSArray* locationArchives = archive[@"locations"];
      NSMutableArray* locations = [NSMutableArray arrayWithCapacity:locationArchives.count];
      
      for (NSDictionary* locationArchive in locationArchives) {
         [locations addObject:[[MTTCompanyLocation alloc] initWithArchive:locationArchive]];
      }
      
      self.locations = locations;
      
      self.companyID = archive[@"id"];
      self.bookingPriorHours = [archive[@"booking_prior_hours"] floatValue];
      self.canCancelLastMinute = [archive[@"can_cancel_last_minute"] boolValue];
   }

   return self;
}

@end
