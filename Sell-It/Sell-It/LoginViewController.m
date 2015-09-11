//
//  LoginViewController.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "LoginViewController.h"

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
    [self makeCircleWithColor:[UIColor redColor] andPercent:0.36 lineWidth:5 mainText:@"36%" subText:@"Revenue Generated" font:[UIFont systemFontOfSize:24] :[UIFont systemFontOfSize:10] onView:self.cView];
}

-(void)makeCircleWithColor:(UIColor*)color andPercent:(CGFloat)val lineWidth:(CGFloat)width mainText:(NSString*)mainText subText:(NSString*)subText font:(UIFont*)fontMain :(UIFont*)fontSub onView:(UIView*)view
{
    
    UILabel* mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width-4, fontMain.capHeight +4)];
    mainLabel.text = mainText;
    mainLabel.textColor = color;
    mainLabel.font = fontMain;
    mainLabel.backgroundColor = [UIColor clearColor];
    mainLabel.textAlignment = NSTextAlignmentCenter;
    UILabel* sublabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width-4, fontSub.capHeight +4)];
    sublabel.text = subText;
    sublabel.textColor = color;
    sublabel.font = fontSub;
    sublabel.backgroundColor = [UIColor clearColor];
    sublabel.textAlignment = NSTextAlignmentCenter;
    mainLabel.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2-mainLabel.frame.size.height/2 + 6);
    sublabel.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2+sublabel.frame.size.height/2 + 6);
    [view addSubview:mainLabel];
    [view addSubview:sublabel];
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(view.frame.size.width/2, view.frame.size.height/2)
                                                              radius:(view.frame.size.width/2 - 8)
                                                          startAngle:3*M_PI_2
                                                            endAngle:(3*M_PI_2+2*M_PI)
                                                           clockwise:YES];
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(view.frame.size.width/2, view.frame.size.height/2)
                                                                radius:(view.frame.size.width/2 - 8)
                                                            startAngle:3*M_PI_2
                                                              endAngle:(3*M_PI_2+val*2*M_PI)
                                                             clockwise:YES];
    CAShapeLayer *circleLayer = [[CAShapeLayer alloc] init];
    circleLayer.path   = circlePath.CGPath;
    [circleLayer setStrokeColor:[UIColor grayColor].CGColor];
    [circleLayer setFillColor:[UIColor clearColor].CGColor];
    circleLayer.lineWidth   = width;
    
    CAShapeLayer *progressLayer = [[CAShapeLayer alloc] init];
    [progressLayer setPath:progressPath.CGPath];
    [progressLayer setStrokeColor:color.CGColor];
    [progressLayer setFillColor:[UIColor clearColor].CGColor];
    [progressLayer setLineWidth:width];
    [view.layer addSublayer:circleLayer];
    [view.layer addSublayer:progressLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration =1;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.repeatCount=1;
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [progressLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginButtonActoin:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"SHOW_TAB" sender:nil];
}



@end
