//
//  AppDelegate.h
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    ManagerRoleTypeSM,//0
    ManagerRoleTypeTSM//1
} ManagerRoleType;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UITabBarController* mainTabBarViewController;
+(AppDelegate*)sharedAppdelegate;
@property (nonatomic,strong) NSArray *colorArray;
@property (nonatomic, strong) NSMutableArray *terManagerArray1;

@end

