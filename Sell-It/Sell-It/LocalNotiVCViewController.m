//
//  LocalNotiVCViewController.m
//  Sell-It
//
//  Created by Danish Jafri on 12/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "LocalNotiVCViewController.h"
#import "AppDelegate.h"

@interface LocalNotiVCViewController ()
@property (weak, nonatomic) IBOutlet UIView *notiView;

@end

@implementation LocalNotiVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notiView.layer.cornerRadius = 5.0;
    self.notiView.clipsToBounds = true;
    self.view.backgroundColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:0.4];
    self.button.layer.cornerRadius = 5.0;
    self.button.layer.borderWidth = 1.0;
    self.button.layer.borderColor = [UIColor colorWithRed:54.0/255 green:142.0/255 blue:244.0/255 alpha:1].CGColor;
    self.label1.text= self.string1;
    self.label2.text = self.string2;
    self.button.hidden = self.buttonHidden;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)notiAction:(id)sender {
    [((AppDelegate*)[UIApplication sharedApplication].delegate).mainTabBarViewController setSelectedIndex:1];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
