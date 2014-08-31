//
//  MTTGoogleReview.h
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/30/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTTGoogleReview : NSObject

@property (nonatomic, strong) NSString* averageRating;
@property (nonatomic, assign) NSUInteger reviewCount;
@property (nonatomic, strong) NSURL* url;

- (instancetype)initWithArchive:(NSDictionary*)archive;

@end
