//
//  FirstViewController.h
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
@interface MapViewController : UIViewController
{
    GMSMapView *mapView_;
    NSDictionary *dictMap;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    NSString *strCurrentLocation;
    NSString *strCurrentCity;
    CLLocationManager *locationManager;
    GMSMarker *maker;
    NSMutableArray *markers;
    CLLocation *currentLocation;
    BOOL isDrawn;
    GMSPath *path;
    
    NSMutableArray *arrLocation;
    NSMutableDictionary *dictLocation;
}

@property (weak, nonatomic) IBOutlet UIView *viewMap;
@property (weak, nonatomic) IBOutlet UIView *viewTMView;

@property (weak, nonatomic) IBOutlet UIView *viewSalesManagerView;
- (IBAction)doctorCompletedAction:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightDoctorCompltedDeatilsView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightDoctorView;




@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightTMView;



@end

