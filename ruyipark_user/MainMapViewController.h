//
//  MainMapViewController.h
//  ruyipark_user
//
//  Created by 李瑜伟 on 14-3-14.
//  Copyright (c) 2014年 ruyipark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>

@interface MainMapViewController : UIViewController <MAMapViewDelegate, AMapSearchDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@end
