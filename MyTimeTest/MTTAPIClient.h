//
//  MTTAPIClient.h
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^MTTAPISuccess)(NSURLSessionDataTask *task, id responseObject);
typedef void (^MTTAPIFailure)(NSURLSessionDataTask *task, NSError *error);

@interface MTTAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (NSURLSessionDataTask*)getDealsWithSearch:(NSString*)searchTerm
                                       time:(NSString*)timePeriod
                                   location:(CLLocation*)location
                                    success:(MTTAPISuccess)success
                                    failure:(MTTAPIFailure)failure;

@end
