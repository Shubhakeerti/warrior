//
//  LoginViewController.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "LoginViewController.h"
#import "LocalReminder.h"
#import "Utils.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *cView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.loginButton addTarget:self action:@selector(loginButtonActoin:) forControlEvents:UIControlEventTouchDragInside];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self makeCircleWithColor:[UIColor redColor] andPercent:0.36 lineWidth:8 mainText:@"36%" subText:@"Revenue Generated" font:[UIFont systemFontOfSize:28] :[UIFont systemFontOfSize:10] onView:self.cView];
    [Utils makeCircleWithColor:[UIColor redColor] andPercent:0.36 lineWidth:5 mainText:@"36%" subText:@"Revenue Generated" font:[UIFont systemFontOfSize:24] :[UIFont systemFontOfSize:10] onView:self.cView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginButtonActoin:(UIButton *)sender
{
    [LocalReminder setLocalReminderOfType:LocalReminderTypeAssign fireDate:[NSDate date] message:@"Hello" object:nil];
    [self performSegueWithIdentifier:@"SHOW_TAB" sender:nil];
}



@end
