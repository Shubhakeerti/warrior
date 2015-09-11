//
//  Utils.h
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 12/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface Utils : NSObject

+(UIImage*)settingImageForContactsWithName:(NSString*)name withKey:(NSString *)key;
+(UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha;
+(UIColor *)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha;
+(void)cropViewCircle:(UIImageView *)view;

@end
