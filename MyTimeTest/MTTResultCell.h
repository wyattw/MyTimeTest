//
//  MTTResultCell.h
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTTSearchResult;

@interface MTTResultCell : UICollectionViewCell

- (void)setContentWithSearchResult:(MTTSearchResult*)result;

@end
