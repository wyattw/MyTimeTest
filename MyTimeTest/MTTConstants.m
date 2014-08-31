//
//  MTTConstants.m
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import "MTTConstants.h"

@implementation MTTConstants

+ (NSString*)navBarTitleFontName
{
   return @"MuseoSans-100";
}

+ (NSString*)textFontName
{
   return @"MuseoSans-300";
}

+ (NSString*)boldFontName
{
   return @"MuseoSans-700";
}

+ (UIColor*)textColor
{
   return [UIColor colorWithWhite:0.31 alpha:1.0];
}

+ (UIColor*)activeColor
{
   return [UIColor colorWithRed:0.200 green:0.627 blue:0.706 alpha:1.000];
}

+ (UIColor*)hairlineColor
{
   return [UIColor colorWithWhite:0.800 alpha:1.000];
}

+ (NSString*)placeholderTextFontName
{
   return [MTTConstants textFontName];
}

+ (UIColor*)placeholderTextColor
{
   return [UIColor lightGrayColor];
}

+ (ISO8601DateFormatter*)globalDateFormatter
{
   static ISO8601DateFormatter* _formatter = nil;
   
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
      _formatter = [[ISO8601DateFormatter alloc] init];
   });
   
   return _formatter;
}

@end
