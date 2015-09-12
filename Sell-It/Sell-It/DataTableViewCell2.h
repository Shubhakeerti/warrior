//
//  DataTableViewCell2.h
//  Sell-It
//
//  Created by Danish Jafri on 12/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataTableViewCell2 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *seperatoView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *seperatorViewHeight;

@end
