//
//  AppDelegate.h
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UITabBarController* mainTabBarViewController;
+(AppDelegate*)sharedAppdelegate;
@property (nonatomic,strong) NSArray *colorArray;

@end

