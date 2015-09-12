//
//  TMCell.h
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *terManagerImageView;
@property (weak, nonatomic) IBOutlet UILabel *terManagerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *terManagerLoaclityLabel;
@property (weak, nonatomic) IBOutlet UILabel *terManagerSalesCount;
@property (weak, nonatomic) IBOutlet UIImageView *rankingImageView;

@end
