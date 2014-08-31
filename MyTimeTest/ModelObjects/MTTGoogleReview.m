//
//  MTTGoogleReview.m
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/30/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import "MTTGoogleReview.h"

@implementation MTTGoogleReview

- (instancetype)initWithArchive:(NSDictionary *)archive
{
   self = [super init];
   
   if (self) {
      // Not sure what format this is supposed to be, so we'll stick with strings for now
      self.averageRating = archive[@"avg_rating"];
      
      self.reviewCount = [archive[@"review_count"] unsignedIntegerValue];
      
      self.url = [NSURL URLWithString:archive[@"url"]];
   }
   
   return self;
}

@end
