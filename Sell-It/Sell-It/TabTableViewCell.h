//
//  TabTableViewCell.h
//  Sell-It
//
//  Created by Danish Jafri on 12/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *tab1;
@property (weak, nonatomic) IBOutlet UIView *tab2;
@property (weak, nonatomic) IBOutlet UIView *tab3;
@property (weak, nonatomic) IBOutlet UILabel *tab1Main;
@property (weak, nonatomic) IBOutlet UILabel *tab1Sub;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthTab;
@property (weak, nonatomic) IBOutlet UILabel *tab2Main;
@property (weak, nonatomic) IBOutlet UILabel *tab2Sub;
@property (weak, nonatomic) IBOutlet UILabel *tab3Main;
@property (weak, nonatomic) IBOutlet UILabel *tab3Sub;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

@end
