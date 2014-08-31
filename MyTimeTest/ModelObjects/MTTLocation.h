//
//  MTTLocation.h
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/30/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  CLLocation;

@interface MTTLocation : NSObject

@property (nonatomic, assign) NSUInteger locationID;

@property (nonatomic, strong) NSString* streetAddress1;
@property (nonatomic, strong) NSString* streetAddress2;
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* state;
@property (nonatomic, strong) NSString* zip;

@property (nonatomic, strong) NSString* phoneNumber;

@property (nonatomic, strong) NSArray* neighborhoods;
@property (nonatomic, strong) CLLocation* location;


- (instancetype)initWithArchive:(NSDictionary*)archive;

@end


@interface MTTCompanyLocation : MTTLocation

@property (nonatomic, assign) BOOL primary;
@property (nonatomic, strong) NSString* mobileNumber;

@end

@interface MTTSearchResultLocation : MTTLocation

@end