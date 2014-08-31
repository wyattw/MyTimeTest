//
//  MTTSearchResult.h
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTTCompany.h"

@class MTTSearchResultLocation;

@interface MTTSearchResult : NSObject

@property (nonatomic, strong) NSString* resultID;

@property (nonatomic, strong) NSURL* bitlyURL;

@property (nonatomic, strong) MTTCompany* company;
@property (nonatomic, strong) NSString* companyName;

@property (nonatomic, strong) MTTSearchResultLocation* location;
@property (nonatomic, assign) NSUInteger locationsCount;

@property (nonatomic, assign) BOOL connectedCalendar;
@property (nonatomic, strong) NSURL* thumbnailURL;
@property (nonatomic, strong) NSURL* slateBlackURL;
@property (nonatomic, strong) NSArray* googleReviews;
@property (nonatomic, strong) NSTimeZone* companyTimeZone;
@property (nonatomic, assign) NSUInteger mobility;
@property (nonatomic, strong) NSDictionary* modifiersValues;
@property (nonatomic, strong) NSURL* photoURL;
@property (nonatomic, strong) NSArray* photoURLs;
@property (nonatomic, strong) NSURL* website;

@property (nonatomic, strong) NSString* serviceName;
@property (nonatomic, strong) NSArray* nextAppointmentTimes;
@property (nonatomic, assign) float yelpRating;
@property (nonatomic, assign) NSUInteger yelpReviewCount;
@property (nonatomic, strong) NSURL* yelpRatingImage;
@property (nonatomic, strong) NSURL* yelpURL;

@property (nonatomic, assign) NSUInteger dealID;
@property (nonatomic, strong) NSString* slugPath;
@property (nonatomic, assign) BOOL onSale;

@property (nonatomic, assign) float minPrice;
@property (nonatomic, assign) float maxPrice;

- (instancetype)initWithArchive:(NSDictionary*)archive;

@end
