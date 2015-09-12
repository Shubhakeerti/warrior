//
//  AppDelegate.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "AppDelegate.h"
#import "LocalNotiVCViewController.h"

#import <GoogleMaps/GoogleMaps.h>
@interface AppDelegate ()

@end

@implementation AppDelegate
{
    UINavigationController* rootNavViewController;
}

+(AppDelegate*)sharedAppdelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        // iOS 8 Notifications
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [application registerForRemoteNotifications];
    }
    else
    {
        // iOS < 8 Notifications
        [application registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
    }
    UILocalNotification *localNotif =
    [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotif) {
        [[NSNotificationCenter defaultCenter] addObserverForName:@"AppointmentHistoryViewControllerCreated" object:nil queue:nil usingBlock:^(NSNotification *note) {
            [self performSelector:@selector(handleLocalNotifications:) withObject:localNotif.userInfo afterDelay:1];
        }];
    }
    [GMSServices provideAPIKey:@"AIzaSyDHpR8juvIkHlIEt0JfXuOO1tppeStF-GY"];
    
    return YES;
}

-(void)handleLocalNotifications:(NSDictionary*)userInfo
{
    //push view here
    rootNavViewController = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LocalNotiVCViewController*modal = [storyboard instantiateViewControllerWithIdentifier:@"ModalNoti"];
    modal.modalPresentationStyle = UIModalPresentationFormSheet;
    modal.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [rootNavViewController.topViewController presentViewController:modal animated:YES completion:^{
        
    }];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    rootNavViewController = (UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LocalNotiVCViewController*modal = [storyboard instantiateViewControllerWithIdentifier:@"ModalNoti"];
    modal.modalPresentationStyle = UIModalPresentationPopover;
    modal.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [rootNavViewController.visibleViewController presentViewController:modal animated:YES completion:^{
        
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
