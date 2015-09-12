//
//  LocalReminder.m
//  Practo
//
//  Created by Danish Jafri on 25/05/15.
//  Copyright (c) 2015 Practo. All rights reserved.
//

#import "LocalReminder.h"

static LocalReminder* localReminder;
@implementation LocalReminder
@synthesize dispatchQ;
NSString * const KLM_Message = @"LOCAL_NOTIFICATION_MESSAGE";
NSString * const KLM_Object = @"LOCAL_NOTIFICATION_OBJECT";
NSString * const KLM_ReminderType = @"LOCAL_NOTIFICATION_REMINDER_TYPE";
-(id)init
{
    self = [super init];
    if (self != nil)
    {
        dispatchQ = dispatch_queue_create("com.practo.local-reminder", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

+(LocalReminder*)getInstance
{
    @synchronized(self)
    {
        if (localReminder == nil)
        {
            localReminder = [[LocalReminder alloc] init];
        }
    }
    return localReminder;
}


+(void)setLocalReminderOfType:(ReminderType)type fireDate:(NSDate*)fireDate message:(NSString*)message object:(id)object
{
    LocalReminder* localReminder = [LocalReminder getInstance];
    dispatch_barrier_async(localReminder.dispatchQ, ^{
        UILocalNotification *localNotif = [[UILocalNotification alloc] init];//LocalNotification Object
        NSMutableDictionary* dict  = [[NSMutableDictionary alloc] init];
        if (localNotif == nil)
        {
            return;
        }
        
        {
            //Setting up the fire date for the reminders. this is a common code, not dependent on the type of reminder. The code below to set date has been prescribed by apple in their online example of local notification. It has something to do with Autoupdatingcalendar
            
            NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
            // Get the current date
            // Break the date up into components
            NSDateComponents *dateComponents = [calendar components:( NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay )
                                                           fromDate:fireDate];
            NSDateComponents *timeComponents = [calendar components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond )
                                                           fromDate:fireDate];
            // Set up the fire time
            NSDateComponents *dateComps = [[NSDateComponents alloc] init];
            [dateComps setDay:[dateComponents day]];
            [dateComps setMonth:[dateComponents month]];
            [dateComps setYear:[dateComponents year]];
            [dateComps setHour:[timeComponents hour]];
            // Notification will fire in one minute
            [dateComps setMinute:[timeComponents minute]];
            [dateComps setSecond:[timeComponents second]];
            NSDate *itemDate = [calendar dateFromComponents:dateComps];
            localNotif.fireDate = itemDate;
            localNotif.timeZone = [NSTimeZone defaultTimeZone];
        }
        {
            //Setting up lcoal notifications details here
            //Message
            if (message!=nil || message.length>0) {
                localNotif.alertBody = message;
                [dict setValue:message forKey:KLM_Message];
            }
            //UserInfo Dictionary
            // Specify custom data for the notification
            if (object!=nil) {
                [dict setObject:[NSKeyedArchiver archivedDataWithRootObject:object] forKey:KLM_Object];
            }
            [dict setValue:@(type) forKey:KLM_ReminderType];
        }
//        if (type == LocalReminderTypeAssign) {
//            // Set the action button
//            localNotif.alertAction = @"View";
//            localNotif.hasAction = true;
//            localNotif.soundName = UILocalNotificationDefaultSoundName;
//            //localNotif.applicationIconBadgeNumber = 1;
//            
//            //Custom Action
//            UIMutableUserNotificationAction *acceptAction =
//            [[UIMutableUserNotificationAction alloc] init];
//            
//            // Define an ID string to be passed back to your app when you handle the action
//            acceptAction.identifier = KLM_Identifier;
//            
//            // Localized string displayed in the action button
//            acceptAction.title = @"Direction";
//            
//            // If you need to show UI, choose foreground
//            acceptAction.activationMode = UIUserNotificationActivationModeForeground;
//            
//            // Destructive actions display in red
//            acceptAction.destructive = NO;
//            
//            // Set whether the action requires the user to authenticate
//            acceptAction.authenticationRequired = NO;
//            UIMutableUserNotificationCategory *inviteCategory =
//            [[UIMutableUserNotificationCategory alloc] init];
//            
//            // Identifier to include in your push payload and local notification
//            inviteCategory.identifier = KLM_Category;
//            
//            // Add the actions to the category and set the action context
//            [inviteCategory setActions:@[acceptAction]
//                            forContext:UIUserNotificationActionContextDefault];
//            
//            // Set the actions to present in a minimal context
//            [inviteCategory setActions:@[acceptAction]
//                            forContext:UIUserNotificationActionContextMinimal];
//            
//            
//            NSSet *categories = [NSSet setWithObjects:inviteCategory, nil];
//            UIUserNotificationType types = UIUserNotificationTypeBadge |
//            UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
//            UIUserNotificationSettings *settings =
//            [UIUserNotificationSettings settingsForTypes:types categories:categories];
//            
//            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//            // Schedule the notification
//            localNotif.category = KLM_Category;
//            [dict setValue:@(location.coordinate.latitude) forKey:KLM_Latitude];
//            [dict setValue:@(location.coordinate.longitude) forKey:KLM_Longitude];
//        }
//        else
//        {
//            //Feedback
//            UIApplication *app = [UIApplication sharedApplication];
//            NSArray *eventArray = [app scheduledLocalNotifications];
//            for (int i=0; i<[eventArray count]; i++)
//            {
//                UILocalNotification* oneEvent = [eventArray objectAtIndex:i];
//                NSDictionary *userInfo = oneEvent.userInfo;
//                NSDate* oldFireDate=[userInfo valueForKey:KLM_FireDate];
//                ReminderType oldType = (ReminderType)[[userInfo valueForKey:KLM_ReminderType] integerValue];
//                if ([oldFireDate isEqualToDate:fireDate] && oldType == type)
//                {
//                    //Cancelling local notification
//                    [app cancelLocalNotification:oneEvent];
//                    break;
//                }
//            }
//        }
        // Notification details
        
        localNotif.userInfo = dict;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    });
}

@end
