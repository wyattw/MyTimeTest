//
//  MTTAPIClient.m
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import "MTTAPIClient.h"

@implementation MTTAPIClient

+ (instancetype)sharedClient
{
   static MTTAPIClient* _sharedClient = nil;
   
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
      _sharedClient = [[MTTAPIClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.mytime.com/api/v1"]
                                       sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
   });
   
   return _sharedClient;
}

- (NSURLSessionDataTask*)getDealsWithSearch:(NSString *)searchTerm
                                       time:(NSString *)timePeriod
                                   location:(CLLocation *)location
                                    success:(MTTAPISuccess)success
                                    failure:(MTTAPIFailure)failure
{
   NSString* path = @"deals.json";
   
   NSMutableDictionary* params = @{}.mutableCopy;
   
   searchTerm = [searchTerm stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
   
   if (searchTerm != nil && searchTerm.length > 0) {
      params[@"what"] = searchTerm;
   }
   
   if (timePeriod != nil && timePeriod.length > 0) {
      params[@"when"] = timePeriod;
   }
   
   if (location != nil) {
      NSString* coords = [NSString stringWithFormat:@"%.6f,%.6f", location.coordinate.latitude, location.coordinate.longitude];
      params[@"where"] = coords;
   }
   
   return [self GET:path
         parameters:params
            success:success
            failure:failure];
}

@end
