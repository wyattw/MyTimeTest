//
//  MTTResultsViewController.m
//  MyTimeTest
//
//  Created by Wyatt Webb on 8/29/14.
//  Copyright (c) 2014 Rain Moose Software. All rights reserved.
//

#import "MTTResultsViewController.h"

#import "MTTAPIClient.h"
#import "MTTAppDelegate.h"
#import "MTTSearchResult.h"
#import "MTTResultCell.h"
#import <CoreLocation/CoreLocation.h>

@interface MTTResultsViewController ()

@property (nonatomic, strong) IBOutletCollection(NSLayoutConstraint) NSArray* hairlineConstraints;

@property (nonatomic, weak) IBOutlet UIButton* filterButton;
@property (nonatomic, weak) IBOutlet UIButton* mapButton;
@property (nonatomic, weak) IBOutlet UISearchBar* searchBar;

@property (nonatomic, weak) IBOutlet UICollectionView* collectionView;

@property (nonatomic, strong) NSMutableArray* results;

@end

@implementation MTTResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   for (NSLayoutConstraint* hairlineConstraint in self.hairlineConstraints) {
      hairlineConstraint.constant = 1 / [[UIScreen mainScreen] scale];
   }
   
   self.results = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
   
   // Get our location
//   [self.locationManager startUpdatingLocation];
   [self getResults];
}

- (void)getResults
{
   static BOOL _fetching = NO;
   
   if (_fetching) {
      return;
   }

   _fetching = YES;
   [[MTTAPIClient sharedClient] getDealsWithSearch:@"Massage"
                                              time:@"Anytime"
                                          location:[[MTTAppDelegate sharedDelegate] lastLocation]
                                           success:^(NSURLSessionDataTask *task, id responseObject) {
                                              
                                              NSArray* results = responseObject;

                                              // Unarchive these results
                                              [self.results removeAllObjects];
                                              
                                              for (NSDictionary* resultArchive in results) {
                                                 [self.results addObject:[[MTTSearchResult alloc] initWithArchive:resultArchive]];
                                              }

                                              [self.collectionView reloadData];
                                              
                                              _fetching = NO;
                                           }
                                           failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              NSLog(@"Error fetching results. Error: %@", error);
                                              _fetching = NO;
                                           }];
}

#pragma UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
   return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return self.results.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   MTTResultCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ResultCell" forIndexPath:indexPath];
   
   [cell setContentWithSearchResult:self.results[indexPath.item]];
   
   return cell;
}

@end
