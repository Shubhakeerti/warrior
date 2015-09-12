//
//  FirstViewController.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "MapViewController.h"
#import "AppDelegate.h"
#import "DoctorDetailViewController.h"
NSString * const kClinicLat=@"latitude";
NSString * const kClinicLon=@"longitude";

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize viewMap;

- (void)viewDidLoad {
    [super viewDidLoad];
    arrLocation=[[NSMutableArray alloc] init];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.908590",kClinicLat,@"77.570217",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.910993",kClinicLat,@"77.572871",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.917645",kClinicLat,@"77.573376",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.916906",kClinicLat,@"77.600045",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.900028",kClinicLat,@"77.600867",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.892266",kClinicLat,@"77.582034",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.861771",kClinicLat,@"77.580328",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.864112",kClinicLat,@"77.554291",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.876434",kClinicLat,@"77.566488",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.908837",kClinicLat,@"77.570153",kClinicLon,nil]];
    [arrLocation addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@"12.908590",kClinicLat,@"77.570217",kClinicLon,nil]];

    
    dictLocation=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"12.908590",kClinicLat,@"77.570217",kClinicLon, nil];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    self.navigationController.topViewController.title = @"Ares";

    
    [self.navigationItem setHidesBackButton:YES animated:YES];

    
    AppDelegate * appdelegate = [[UIApplication sharedApplication]delegate];
    if(true)
    {
        [self loadMap_TM:dictLocation];
        [self.viewTMView setHidden:NO];
        [self.viewSalesManagerView setHidden:YES];
    }else{
        [self loadMap:dictLocation];
        [self.viewTMView setHidden:YES];
        [self.viewSalesManagerView setHidden:NO];
    }
}

-(void)setHitMap:(UIColor *)color
{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:0
                                                            longitude:-165
                                                                 zoom:2];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    GMSMutablePath *path = [GMSMutablePath path];
    for (int i=0; i<[arrLocation count]; i++) {
        [path addLatitude:[[[arrLocation objectAtIndex:i] objectForKey:kClinicLat] floatValue] longitude:[[[arrLocation objectAtIndex:i] objectForKey:kClinicLon] floatValue]];
    }
    GMSPolygon* poly = [GMSPolygon polygonWithPath:path];
    poly.strokeWidth = 2.0;
    poly.strokeColor = [UIColor colorWithRed:2.0/255.0f green:166.0/255.0f blue:216.0/255.0f alpha:1];
    poly.fillColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
    poly.map = mapView_;
    
    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] initWithPath:path];
    [mapView_ animateWithCameraUpdate:[GMSCameraUpdate fitBounds:bounds withPadding:28.0f]];
}


-(void)loadMap_TM:(NSDictionary *)dictMapLocation
{
    @try
    {
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[[dictMapLocation objectForKey:kClinicLat] floatValue]
                                                                longitude:[[dictMapLocation objectForKey:kClinicLon] floatValue]
                                                                     zoom:16];
        mapView_ = [GMSMapView mapWithFrame:viewMap.bounds camera:camera];
        mapView_.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        mapView_.translatesAutoresizingMaskIntoConstraints = true;
        GMSMarker* maker1=[[GMSMarker alloc] init];
        maker1.position=CLLocationCoordinate2DMake([@"12.904549" floatValue], [@"77.582952" floatValue]);
        maker1.title=[dictMapLocation objectForKey:kClinicLat];
        maker1.snippet=[dictMapLocation objectForKey:kClinicLon];
        maker1.icon=[UIImage imageNamed:@"red.png"];
        maker1.map=mapView_;
        [markers addObject:maker1];
        
        
        GMSMarker* maker2=[[GMSMarker alloc] init];
        maker2.position=CLLocationCoordinate2DMake([@"12.9118374" floatValue], [@"77.57949499999995" floatValue]);
        maker2.icon=[UIImage imageNamed:@"blue.png"];
        maker2.map=mapView_;
        [markers addObject:maker2];
        
        
        GMSMarker* maker3=[[GMSMarker alloc] init];
        maker3.position=CLLocationCoordinate2DMake([@"12.8940928" floatValue], [@"77.579494" floatValue]);
        maker3.icon=[UIImage imageNamed:@"yellow.png"];
        maker3.map=mapView_;
        [markers addObject:maker3];
        
        
        GMSMarker* maker4=[[GMSMarker alloc] init];
        maker4.position=CLLocationCoordinate2DMake([@"12.9113782" floatValue], [@"77.5866573" floatValue]);
        maker4.icon=[UIImage imageNamed:@"green.png"];
        maker4.map=mapView_;
        [markers addObject:maker4];
        
        
        GMSMarker* maker5=[[GMSMarker alloc] init];
        maker5.position=CLLocationCoordinate2DMake([@"12.8658517" floatValue], [@"77.5719908" floatValue]);
        maker5.icon=[UIImage imageNamed:@"green.png"];
        maker5.map=mapView_;
        [markers addObject:maker5];
        
        
        GMSMarker* maker6=[[GMSMarker alloc] init];
        maker6.position=CLLocationCoordinate2DMake([@"12.903517" floatValue], [@"77.5920295" floatValue]);
        maker6.icon=[UIImage imageNamed:@"yellow.png"];
        maker6.map=mapView_;
        [markers addObject:maker6];
        
        
        
        [self.viewMap addSubview:mapView_];
        [self setHitMap:[UIColor grayColor]];
    }
    @catch (NSException *exception)
    {
        [mapView_ setHidden:YES];
        return;
    }
    @finally
    {
        NSLog( @"In finally block");
    }
}



-(void)loadMap:(NSDictionary *)dictMapLocation
{
        @try
        {
            GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[[dictMapLocation objectForKey:kClinicLat] floatValue]
                                                                    longitude:[[dictMapLocation objectForKey:kClinicLon] floatValue]
                                                                         zoom:16];
            mapView_ = [GMSMapView mapWithFrame:viewMap.bounds camera:camera];
            mapView_.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            mapView_.translatesAutoresizingMaskIntoConstraints = true;
            GMSMarker* maker1=[[GMSMarker alloc] init];
            maker1.position=CLLocationCoordinate2DMake([@"12.904549" floatValue], [@"77.582952" floatValue]);
            maker1.title=[dictMapLocation objectForKey:kClinicLat];
            maker1.snippet=[dictMapLocation objectForKey:kClinicLon];
            maker1.icon=[UIImage imageNamed:@"TM3.png"];
            maker1.map=mapView_;
            [markers addObject:maker1];
            
            
            GMSMarker* maker2=[[GMSMarker alloc] init];
            maker2.position=CLLocationCoordinate2DMake([@"12.9118374" floatValue], [@"77.57949499999995" floatValue]);
            maker2.title=@"TM 2";
            maker2.snippet=@"Jp nagar 1st phase";
            maker2.icon=[UIImage imageNamed:@"TM3.png"];
            maker2.map=mapView_;
            [markers addObject:maker2];
            
            
            GMSMarker* maker3=[[GMSMarker alloc] init];
            maker3.position=CLLocationCoordinate2DMake([@"12.8940928" floatValue], [@"77.579494" floatValue]);
            maker3.title=@"TM 3";
            maker3.snippet=@"Jp nagar 2nd phase";
            maker3.icon=[UIImage imageNamed:@"TM3.png"];
            maker3.map=mapView_;
            [markers addObject:maker3];
            
            [self.viewMap addSubview:mapView_];
            [self setHitMap:[UIColor grayColor]];
        }
        @catch (NSException *exception)
        {
            [mapView_ setHidden:YES];
            return;
        }
        @finally
        {
            NSLog( @"In finally block");
        }
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    self.navigationController.navigationBarHidden = NO;
//    self.navigationItem.leftBarButtonItem=nil;
//    self.navigationItem.hidesBackButton=YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doctorCompletedAction:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    DoctorDetailViewController *doctorDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"DoctorDetailViewController"];
    [self.navigationController presentViewController:doctorDetailViewController animated:YES completion:nil];

}
@end
