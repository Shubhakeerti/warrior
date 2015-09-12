//
//  LocalNotiVCViewController.h
//  Sell-It
//
//  Created by Danish Jafri on 12/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocalNotiVCViewController : UIViewController
- (IBAction)closeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)notiAction:(id)sender;

@property (nonatomic) NSString* string1;
@property (nonatomic) NSString* string2;
@property (nonatomic) BOOL buttonHidden;
@end
