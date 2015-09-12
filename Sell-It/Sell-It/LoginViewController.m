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
    [AppDelegate sharedAppdelegate].loginViewController = self;
    self.navigationController.navigationBarHidden = YES;
    [self.loginButton addTarget:self action:@selector(loginButtonActoin:) forControlEvents:UIControlEventTouchDragInside];
    self.loginButton.layer.cornerRadius = 3.0;
    self.loginButton.layer.borderWidth = 1.0;
    self.loginButton.layer.borderColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5].CGColor;
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginButtonActoin:(UIButton *)sender
{
    [LocalReminder setLocalReminderOfType:LocalReminderTypeLeaderBoard fireDate:[NSDate date] message:@"CONGRATULATIONS! Your rank just went up on leaderboard!" object:nil];
    [self performSegueWithIdentifier:@"SHOW_TAB" sender:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.tabBarController = (UITabBarController*)segue.destinationViewController;
    
    UITabBarItem *item1 = [self.tabBarController.tabBar.items objectAtIndex:0];
    
    [self creatingTabBarItemWithTitle:item1 withTitle:@"Maps"];
    
    UITabBarItem *item2 = [self.tabBarController.tabBar.items objectAtIndex:1];
    
    [self creatingTabBarItemWithTitle:item2 withTitle:@"Leaderboard"];
    
    UITabBarItem *item3 = [self.tabBarController.tabBar.items objectAtIndex:2];
    
    [self creatingTabBarItemWithTitle:item3 withTitle:@"Dashboard"];
    
    if ([segue.identifier isEqualToString:@"SHOW_TAB"]) {
        ((AppDelegate*)[UIApplication sharedApplication].delegate).mainTabBarViewController = segue.destinationViewController;
    }
}

-(void)creatingTabBarItemWithTitle:(UITabBarItem *)tabItem withTitle:(NSString *)title{
    tabItem.title = title;
    tabItem.titlePositionAdjustment = UIOffsetMake(0, -5.0);
    tabItem.imageInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    if ([title isEqualToString:@"Maps"])
    {
        UIImage *selectedImage0 = [UIImage imageNamed:@"Maps.png"];
        UIImage *unselectedImage0 = [UIImage imageNamed:@"Maps Copy.png"];
        tabItem.image = [selectedImage0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
        tabItem.selectedImage = [unselectedImage0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else if ([title isEqualToString:@"Leaderboard"])
    {
        UIImage *selectedImage1 = [UIImage imageNamed:@"Leaderboard.png"];
        UIImage *unselectedImage1 = [UIImage imageNamed:@"Leaderboard Copy.png"];
        tabItem.image = [selectedImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
        tabItem.selectedImage = [unselectedImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else if ([title isEqualToString:@"Dashboard"])
    {
        UIImage *selectedImage2 = [UIImage imageNamed:@"Dashboard.png"];
        UIImage *unselectedImage2 = [UIImage imageNamed:@"Dashboard Copy.png"];
        tabItem.image = [selectedImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
        tabItem.selectedImage = [unselectedImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    NSDictionary *deSelectedTextAttributesDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                                  [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1.0f], UITextAttributeTextColor,
                                                  [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 4.0f)], UITextAttributeTextShadowOffset,
                                                  [UIColor clearColor],UITextAttributeTextShadowColor,
                                                  [UIFont fontWithName:@"HelveticaNeue-Light" size:9],UITextAttributeFont,
                                                  nil];
    NSDictionary *selectedTextAttributesDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                                [UIColor colorWithRed:0.0f/255.0f green:136.0f/255.0f blue:187.0f/255.0f alpha:1.0f], UITextAttributeTextColor,
                                                [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 4.0f)], UITextAttributeTextShadowOffset,
                                                [UIColor clearColor],UITextAttributeTextShadowColor,
                                                [UIFont fontWithName:@"HelveticaNeue-Light" size:9],UITextAttributeFont,
                                                nil];
    [tabItem setTitleTextAttributes:deSelectedTextAttributesDict forState:UIControlStateNormal];
    [tabItem setTitleTextAttributes:selectedTextAttributesDict forState:UIControlStateHighlighted];
    
//    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar_opaque.png"]];
//    [[UITabBar appearance]setSelectionIndicatorImage:[UIImage imageNamed:@"tabbg.png"]];
    
    [[UITabBar appearance]setBackgroundColor:[UIColor clearColor]];
}
    
@end
