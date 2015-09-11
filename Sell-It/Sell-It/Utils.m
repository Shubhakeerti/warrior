//
//  Utils.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 12/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "Utils.h"
#import <CoreImage/CoreImage.h>
#import <UIImageView+WebCache.h>


@implementation Utils

+(UIImage*)settingImageForContactsWithName:(NSString*)name withKey:(NSString *)key{
    
    if ([[AppDelegate sharedAppdelegate] colorArray] == nil || [[AppDelegate sharedAppdelegate] colorArray].count == 0)
    {
        [[AppDelegate sharedAppdelegate] setColorArray:[[NSArray alloc]initWithObjects:@"#33b679",@"#536173",@"#855e86",@"#df5948",@"#aeb857",@"#547bca",@"#ae6b23",@"#e5ae4f", nil]];
    }
    UIImage *image;
    if ([[SDImageCache sharedImageCache]diskImageExistsWithKey:key])
    {
        image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
        if (image)
        {
            return image;
        }
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    //    label.font = [UIFont boldSystemFontOfSize:30];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:50];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    NSInteger integer = abs(arc4random())%7;
    NSString *randonColorHexString = [[AppDelegate sharedAppdelegate].colorArray objectAtIndex:integer];
    label.backgroundColor = [self colorWithHexString:randonColorHexString andAlpha:1.0f];
    label.text = [[name substringToIndex:1] uppercaseString];
    UIGraphicsBeginImageContext([label bounds].size);
    [[label layer] renderInContext: UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[SDWebImageManager sharedManager] saveImageToCache:image forURL:[NSURL URLWithString:key]];
    return image;
}

+(UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha {
    UIColor *col;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
    uint hexValue;
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
        col = [self colorWithHexValue:hexValue andAlpha:alpha];
    } else {
        col = [UIColor clearColor];
    }
    return col;
}

+(UIColor *)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alpha];
}

+(void)cropViewCircle:(UIImageView *)view
{
    CALayer *imageLayer = view.layer;
    [imageLayer setCornerRadius:view.frame.size.width/2];
    [imageLayer setMasksToBounds:YES];
    imageLayer = nil;
}

@end
