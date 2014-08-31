//
//  MTTConstants.h
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ISO8601DateFormatter/ISO8601DateFormatter.h>

@interface MTTConstants : NSObject

+ (NSString*)navBarTitleFontName;

+ (NSString*)textFontName;
+ (NSString*)boldFontName;

+ (UIColor*)textColor;

+ (UIColor*)activeColor;

+ (UIColor*)hairlineColor;

+ (NSString*)placeholderTextFontName;

+ (UIColor*)placeholderTextColor;

+ (ISO8601DateFormatter*)globalDateFormatter;

@end
