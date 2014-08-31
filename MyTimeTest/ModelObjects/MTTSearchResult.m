//
//  MTTSearchResult.m
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import "MTTSearchResult.h"

#import "MTTConstants.h"
#import "MTTGoogleReview.h"
#import "MTTLocation.h"
#import <CoreLocation/CoreLocation.h>

@implementation MTTSearchResult

- (instancetype)initWithArchive:(NSDictionary *)archive
{
   self = [super init];
   
   if (self) {
      // Extract data from the archive
      self.resultID = archive[@"id"];
      
      self.bitlyURL = [NSURL URLWithString:archive[@"bitly_url"]];
      
      self.company = [[MTTCompany alloc] initWithArchive:archive[@"company"]];
      self.companyName = archive[@"name"];

      // This will extract all of the location information from the main archive
      self.location = [[MTTSearchResultLocation alloc] initWithArchive:archive];
      self.locationsCount = [archive[@"locations_count"] unsignedIntegerValue];
      
      self.connectedCalendar = [archive[@"connected_calendar"] boolValue];
      self.thumbnailURL = [NSURL URLWithString:archive[@"default_photo_thumb"]];
      self.slateBlackURL = [NSURL URLWithString:archive[@"default_photo_slate_black"]];

      NSArray* googleReviewArchives = archive[@"google_reviews"];
      
      NSMutableArray* googleReviews = [NSMutableArray arrayWithCapacity:googleReviewArchives.count];
      
      for (NSDictionary* reviewArchive in googleReviewArchives) {
         [googleReviews addObject:[[MTTGoogleReview alloc] initWithArchive:reviewArchive]];
      }
      
      self.googleReviews = googleReviews;
      
      self.companyTimeZone = [NSTimeZone timeZoneWithName:archive[@"merchant_time_zone"]];
      self.mobility = [archive[@"mobility"] unsignedIntegerValue];
      self.modifiersValues = archive[@"modifiers_values"];
      self.photoURL = [NSURL URLWithString:archive[@"photo_url"]];
      self.website = [NSURL URLWithString:archive[@"website"]];
      
      NSArray* photoURLArchives = archive[@"photo_urls"];
      NSMutableArray* photoURLs = [NSMutableArray arrayWithCapacity:photoURLArchives.count];
      
      for (NSString* photoURLArchive in photoURLArchives) {
         [photoURLs addObject:[NSURL URLWithString:photoURLArchive]];
      }
      
      self.serviceName = archive[@"service_name"];

      NSArray* appointmentArchives = archive[@"next_appointment_times"];
      NSMutableArray* appointments = [NSMutableArray arrayWithCapacity:appointmentArchives.count];
      
      for (NSString* time in appointmentArchives) {
         [appointments addObject:[[MTTConstants globalDateFormatter] dateFromString:time]];
      }
      
      self.nextAppointmentTimes = appointments;
      
      self.yelpRating = [archive[@"yelp_rating"] floatValue];
      self.yelpRatingImage = [NSURL URLWithString:archive[@"yelp_rating_image_url"]];
      self.yelpReviewCount = [archive[@"yelp_review_count"] unsignedIntegerValue];
      self.yelpURL = [NSURL URLWithString:archive[@"yelp_url"]];
      
      self.dealID = [archive[@"deal_id"] unsignedIntegerValue];
      self.slugPath = archive[@"slug_path"];
      self.onSale = [archive[@"on_sale"] boolValue];
      
      self.minPrice = [archive[@"min_price"] floatValue];
      self.maxPrice = [archive[@"max_price"] floatValue];
   }
   
   return self;
}

@end
