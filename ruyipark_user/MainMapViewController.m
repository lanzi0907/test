//
//  MainMapViewController.m
//  ruyipark_user
//
//  Created by 李瑜伟 on 14-3-14.
//  Copyright (c) 2014年 ruyipark. All rights reserved.
//

#import "MainMapViewController.h"

@interface MainMapViewController ()

@end

@implementation MainMapViewController

@synthesize mapView = _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - AMapSearchDelegate

- (void)search:(id)searchRequest error:(NSString *)errInfo
{
    NSLog(@"%s: searchRequest = %@, errInfo= %@", __func__, [searchRequest class], errInfo);
}

/**
 * Initialize the Map view
 */
 
- (void)initMapView
{
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    self.mapView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+self.navigationController.navigationBar.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height-10);
    
    self.mapView.delegate = self;
    
    self.mapView.mapType = MAMapTypeStandard;
    
    self.mapView.showsScale= YES;
    
    self.mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
    
    [self.view addSubview:self.mapView];
    
    self.mapView.visibleMapRect = MAMapRectMake(220880104, 101476980, 272496, 466656);
}
/**
 * Initialize the title
 */
- (void)initTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] init];
    
    titleLabel.backgroundColor  = [UIColor clearColor];
    titleLabel.textColor        = [UIColor whiteColor];
    titleLabel.text             = title;
    [titleLabel sizeToFit];
    
    self.navigationItem.titleView = titleLabel;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTitle:@"Li Yu wei"];
    [self initMapView];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //Set the default zoom level before the view is displayed
    [self.mapView setZoomLevel:13.0];
    self.mapView.showsUserLocation = YES;
    
//    [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate animated:YES];
    NSLog(@"The user's location, latitude: %f", self.mapView.userLocation.coordinate.latitude);
    
    NSLog(@"The user's location, longitude: %f", self.mapView.userLocation.coordinate.longitude);
}

#pragma mark - Action Handle
//- (void)showsSegmentAction:(UISegmentedControl *)sender
//{
//    self.mapView.showsUserLocation = !sender.selectedSegmentIndex;
//}
//
//- (void)modeAction:(UISegmentedControl *)sender
//{
//    self.mapView.userTrackingMode = sender.selectedSegmentIndex;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
