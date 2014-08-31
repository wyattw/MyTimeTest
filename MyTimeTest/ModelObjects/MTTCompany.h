//
//  MTTCompany.h
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTTCompany : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSString* learningTrade;
@property (nonatomic, strong) NSString* businessDiffs;
@property (nonatomic, strong) NSString* whyLove;

@property (nonatomic, strong) NSArray* locations;

@property (nonatomic, strong) NSString* companyID;
@property (nonatomic, assign) float bookingPriorHours;
@property (nonatomic, assign) BOOL canCancelLastMinute;


- (instancetype)initWithArchive:(NSDictionary*)archive;

@end
