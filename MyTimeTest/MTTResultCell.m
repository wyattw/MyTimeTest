//
//  MTTResultCell.m
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import "MTTResultCell.h"

#import "MTTAppDelegate.h"
#import "MTTConstants.h"
#import "MTTLocation.h"
#import "MTTSearchResult.h"

#import <AFNetworking/UIImageView+AFNetworking.h>
#import <CoreLocation/CoreLocation.h>

@interface MTTResultCell()

@property (nonatomic, weak) IBOutlet UIImageView* thumbnail;
@property (nonatomic, weak) IBOutlet UILabel* companyNameLabel;
@property (nonatomic, weak) IBOutlet UILabel* serviceLabel;
@property (nonatomic, weak) IBOutlet UILabel* distanceLabel;
@property (nonatomic, weak) IBOutlet UIImageView* nextAppointmentBolt;
@property (nonatomic, weak) IBOutlet UILabel* nextAppointment;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint* hairlineConstraint;

@property (nonatomic, weak) IBOutlet UIImageView* yelpRatingImage;
@property (nonatomic, weak) IBOutlet UILabel* saleLabel;
@property (nonatomic, weak) IBOutlet UILabel* saleTag;

@property (nonatomic, strong) MTTSearchResult* searchResult;

@end

@implementation MTTResultCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
   self.contentView.clipsToBounds = YES;
   self.contentView.layer.cornerRadius = 6.0;
   
   self.companyNameLabel.font = [UIFont fontWithName:[MTTConstants boldFontName]
                                                size:14.0];
   self.companyNameLabel.textColor = [MTTConstants textColor];
   
   self.serviceLabel.font = [UIFont fontWithName:[MTTConstants textFontName]
                                             size:12.0];
   self.serviceLabel.textColor = [MTTConstants textColor];
   
   self.distanceLabel.font = self.serviceLabel.font;
   self.distanceLabel.textColor = self.serviceLabel.textColor;
   
   self.nextAppointment.font = self.serviceLabel.font;
   self.nextAppointment.textColor = [MTTConstants activeColor];
   
   self.hairlineConstraint.constant = 1 / [[UIScreen mainScreen] scale];
   
   self.saleLabel.font = [UIFont fontWithName:[MTTConstants boldFontName]
                                         size:18.0];
   self.saleLabel.textColor = self.companyNameLabel.textColor;
   
   self.saleTag.font = [UIFont fontWithName:[MTTConstants boldFontName]
                                       size:12.0];
}

- (void)setContentWithSearchResult:(MTTSearchResult*)result
{
   self.searchResult = result;
   
   self.thumbnail.image = nil;

   NSURL* imageURL = self.searchResult.thumbnailURL ? : self.searchResult.photoURL;
   
   [self.thumbnail setImageWithURL:imageURL];
   
   self.companyNameLabel.text = self.searchResult.company.name;
   self.serviceLabel.text = self.searchResult.serviceName;
   
   // Calculate distance
   CLLocationDistance distance = [[MTTAppDelegate sharedDelegate].lastLocation distanceFromLocation:self.searchResult.location.location];
   
   double milesDistance = distance / 1609.34;
   
   self.distanceLabel.text = [NSString stringWithFormat:@"%0.1f mi away", milesDistance];
   
   // Find next appointment time
   if (self.searchResult.nextAppointmentTimes.count > 0) {
      NSString* date = [NSDateFormatter localizedStringFromDate:self.searchResult.nextAppointmentTimes.firstObject
                                                      dateStyle:NSDateFormatterShortStyle
                                                      timeStyle:NSDateFormatterNoStyle];
      self.nextAppointment.text = [NSString stringWithFormat:@"Next appt %@", date];
      self.nextAppointmentBolt.hidden = NO;
   } else {
      self.nextAppointment.text = nil;
      self.nextAppointmentBolt.hidden = YES;
   }
   
   // Set yelp rating
   NSString* imageName = [NSString stringWithFormat:@"yelp_%g_stars.png", self.searchResult.yelpRating];
   self.yelpRatingImage.image = [UIImage imageNamed:imageName];
   
   BOOL hasPrices = (self.searchResult.minPrice != 0 && self.searchResult.maxPrice != 0);
   
   if (hasPrices) {
      // Set prices
      self.saleLabel.text = [NSString stringWithFormat:@"$%d - $%d", (int)self.searchResult.minPrice, (int)self.searchResult.maxPrice];
   }

   self.saleLabel.hidden = !hasPrices;
   self.saleTag.hidden = !self.searchResult.onSale;

}

@end
