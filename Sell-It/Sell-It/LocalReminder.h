//
//  LocalReminder.h
//  Practo
//
//  Created by Danish Jafri on 25/05/15.
//  Copyright (c) 2015 Practo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface LocalReminder : NSObject
extern NSString * const KLM_Message;
extern NSString * const KLM_Object;
extern NSString * const KLM_ReminderType;
typedef enum {
    LocalReminderTypeAssign,//0
    LocalReminderTypeLeaderBoard,//1
    LocalReminderTypeLeadConversion
} ReminderType;
@property (nonatomic)dispatch_queue_t  dispatchQ;
+(void)setLocalReminderOfType:(ReminderType)type fireDate:(NSDate*)fireDate message:(NSString*)message object:(id)object;
@end
