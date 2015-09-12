//
//  DoctorDetailViewController.h
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorDetailViewController : UIViewController
{
    NSString *target;
    int iss;
}
-(void)initWithDoctorDetails:(NSString *)strTarget;
- (IBAction)backAction:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *btnStatus;

@end
