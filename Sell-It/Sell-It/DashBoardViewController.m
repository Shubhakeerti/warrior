//
//  DashBoardViewController.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "DashBoardViewController.h"
#import "NameTableViewCell.h"
#import "TabTableViewCell.h"
#import "DataTableViewCell1.h"
#import "DataTableViewCell2.h"
#import "DataTableViewCell3.h"
#import "DatePickerTableViewCell.h"
#import "AppDelegate.h"
#import "Utils.h"

#define blueColor [UIColor colorWithRed:54.0/255.0 green:142.0/255.0 blue:244.0/255.0 alpha:1]
@interface DashBoardViewController ()

@end

@implementation DashBoardViewController
{
    int selectedIndex;
    int previousIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Dashboard";
    selectedIndex = 0;
    previousIndex = 0;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(mainAction)];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mainAction
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
       shouldReceiveTouch:(UITouch *)touch
{
    return true;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            static NSString *CellIdentifier = @"name";
            NameTableViewCell *searchCell = (NameTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!searchCell) {
                searchCell = (NameTableViewCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            searchCell.nameLabel.text = @"Danish Jafri";
            searchCell.designationLabel.text = @"sales Manager -bangalore";
            searchCell.emailLabel.text = @"danishjafri88@gmail.com";
            searchCell.phoneLabel.text = @"8105151960";
            searchCell.imageViewManager.image = [Utils settingImageForContactsWithName:@"Danish" withKey:@"Danish"];
            [Utils cropViewCircle:searchCell.imageViewManager];
            return searchCell;
            
        }
            break;
        case 1:
        {
            static NSString *CellIdentifier = @"tabs";
            TabTableViewCell *searchCell = (TabTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!searchCell) {
                searchCell = (TabTableViewCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            searchCell.widthTab.constant = ([UIScreen mainScreen].bounds.size.width-8)/3;
            [self.view setNeedsDisplay];
            switch (selectedIndex) {
                case 0:
                {
                    [self setBorderForView:searchCell.tab1 withColor:blueColor];
                    [self setBorderForView:searchCell.tab2 withColor:[UIColor lightGrayColor]];
                    [self setBorderForView:searchCell.tab3 withColor:[UIColor lightGrayColor]];
                    searchCell.tab1Main.textColor = blueColor;
                    searchCell.tab1Sub.textColor = blueColor;
                    searchCell.tab2Main.textColor = [UIColor lightGrayColor];
                    searchCell.tab2Sub.textColor = [UIColor lightGrayColor];
                    searchCell.tab3Main.textColor = [UIColor lightGrayColor];
                    searchCell.tab3Sub.textColor = [UIColor lightGrayColor];
                    
                }
                    break;
                case 1:
                {
                    [self setBorderForView:searchCell.tab1 withColor:[UIColor lightGrayColor]];
                    [self setBorderForView:searchCell.tab2 withColor:blueColor];
                    [self setBorderForView:searchCell.tab3 withColor:[UIColor lightGrayColor]];
                    searchCell.tab1Main.textColor = [UIColor lightGrayColor];
                    searchCell.tab1Sub.textColor = [UIColor lightGrayColor];
                    searchCell.tab2Main.textColor = blueColor;
                    searchCell.tab2Sub.textColor = blueColor;
                    searchCell.tab3Main.textColor = [UIColor lightGrayColor];
                    searchCell.tab3Sub.textColor = [UIColor lightGrayColor];
                }
                    break;
                case 2:
                {
                    [self setBorderForView:searchCell.tab1 withColor:[UIColor lightGrayColor]];
                    [self setBorderForView:searchCell.tab2 withColor:[UIColor lightGrayColor]];
                    [self setBorderForView:searchCell.tab3 withColor:blueColor];
                    searchCell.tab1Main.textColor = [UIColor lightGrayColor];
                    searchCell.tab1Sub.textColor = [UIColor lightGrayColor];
                    searchCell.tab2Main.textColor = [UIColor lightGrayColor];
                    searchCell.tab2Sub.textColor = [UIColor lightGrayColor];
                    searchCell.tab3Main.textColor = blueColor;
                    searchCell.tab3Sub.textColor = blueColor;
                }
                    break;
                    
                default:
                    break;
            }
            [searchCell.button1 addTarget:self action:@selector(handleTap:) forControlEvents:UIControlEventTouchUpInside];
            [searchCell.button2 addTarget:self action:@selector(handleTap:) forControlEvents:UIControlEventTouchUpInside];
            [searchCell.button3 addTarget:self action:@selector(handleTap:) forControlEvents:UIControlEventTouchUpInside];
            searchCell.tab1Main.text = @"26";
            searchCell.tab1Sub.text = @"Doctors";
            searchCell.tab2Main.text = @"37%";
            searchCell.tab2Sub.text = @"Targets";
            searchCell.tab3Main.text = @"54K";
            searchCell.tab3Sub.text = @"Revenue";
            
            
            return searchCell;
        }
            break;
        case 2:
        {
            static NSString *CellIdentifier = @"datePicker";
            DatePickerTableViewCell *searchCell = (DatePickerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!searchCell) {
                searchCell = (DatePickerTableViewCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            return searchCell;
        }
            break;
        case 3:
        {
            switch (selectedIndex) {
                case 0:
                {
                    static NSString *CellIdentifier = @"data1";
                    DataTableViewCell1 *searchCell = (DataTableViewCell1*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                    if (!searchCell) {
                        searchCell = (DataTableViewCell1*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                    }
                    return searchCell;
                }
                    break;
                case 1:
                {
                    static NSString *CellIdentifier = @"data2";
                    DataTableViewCell2 *searchCell = (DataTableViewCell2*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                    if (!searchCell) {
                        searchCell = (DataTableViewCell2*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                    }
                    [self makeCircleWithColor:[UIColor redColor] andPercent:0.36 lineWidth:5 mainText:@"36%" subText:@"Accounts" font:[UIFont systemFontOfSize:24] :[UIFont systemFontOfSize:10] onView:searchCell.view1];
                    [self makeCircleWithColor:blueColor andPercent:0.45 lineWidth:5 mainText:@"36%" subText:@"Revenue" font:[UIFont systemFontOfSize:24] :[UIFont systemFontOfSize:10] onView:searchCell.view2];
                    [self makeCircleWithColor:[UIColor orangeColor] andPercent:0.70 lineWidth:5 mainText:@"36%" subText:@"Targets" font:[UIFont systemFontOfSize:28] :[UIFont systemFontOfSize:10] onView:searchCell.view3];
                    searchCell.seperatorViewHeight.constant = 0.5;
                    return searchCell;
                }
                    break;
                case 2:
                {
                    static NSString *CellIdentifier = @"data3";
                    DataTableViewCell3 *searchCell = (DataTableViewCell3*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                    if (!searchCell) {
                        searchCell = (DataTableViewCell3*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                    }
                    [self makeCircleWithColor:[UIColor redColor] andPercent:0.36 lineWidth:4 mainText:@"3K" subText:@"Starter" font:[UIFont fontWithName:@"HelveticaNeue-Light" size:18] :[UIFont fontWithName:@"HelveticaNeue-Light" size:10] onView:searchCell.view1];
                    [self makeCircleWithColor:blueColor andPercent:0.45 lineWidth:4 mainText:@"2k" subText:@"Pro" font:[UIFont fontWithName:@"HelveticaNeue-Light" size:18] :[UIFont fontWithName:@"HelveticaNeue-Light" size:10] onView:searchCell.view2];
                    [self makeCircleWithColor:[UIColor greenColor] andPercent:0.66 lineWidth:4 mainText:@"1K" subText:@"Tab" font:[UIFont fontWithName:@"HelveticaNeue-Light" size:18] :[UIFont fontWithName:@"HelveticaNeue-Light" size:10] onView:searchCell.view3];
                    [self makeCircleWithColor:[UIColor purpleColor] andPercent:0.85 lineWidth:4 mainText:@"1.5K" subText:@"EMR" font:[UIFont fontWithName:@"HelveticaNeue-Light" size:18] :[UIFont fontWithName:@"HelveticaNeue-Light" size:10] onView:searchCell.view4];
                    [self makeCircleWithColor:[UIColor orangeColor] andPercent:0.75 lineWidth:5 mainText:@"36%" subText:@"Targets" font:[UIFont systemFontOfSize:28] :[UIFont systemFontOfSize:12] onView:searchCell.view5];
                    searchCell.seperatorViewHeight.constant = 0.5;
                    return searchCell;
                }
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        default:
            break;
    }
    static NSString*cellID=@"cellIdentifier";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = @"Nothing";
    
    return  cell;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            return 81;
        }
            break;
        case 1:
        {
            return 56;
        }
            break;
        case 2:
        {
            return 40;
        }
            break;
        case 3:
        {
            return 234;
        }
            break;
        default:
            return 45;
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void)setBorderForView:(UIView*)view withColor:(UIColor*)color{
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = 0.5;
}

-(void)handleTap:(UIButton*)sender
{
    TabTableViewCell *searchCell = (TabTableViewCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    
    switch (sender.tag) {
        case 0:
        {
            if (selectedIndex!=sender.tag) {
                [self setBorderForView:searchCell.tab1 withColor:blueColor];
                [self setBorderForView:searchCell.tab2 withColor:[UIColor lightGrayColor]];
                [self setBorderForView:searchCell.tab3 withColor:[UIColor lightGrayColor]];
                searchCell.tab1Main.textColor = blueColor;
                searchCell.tab1Sub.textColor = blueColor;
                searchCell.tab2Main.textColor = [UIColor lightGrayColor];
                searchCell.tab2Sub.textColor = [UIColor lightGrayColor];
                searchCell.tab3Main.textColor = [UIColor lightGrayColor];
                searchCell.tab3Sub.textColor = [UIColor lightGrayColor];
                previousIndex = selectedIndex;
                selectedIndex = sender.tag;
                [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
            }
            
        }
            break;
        case 1:
        {
            if (selectedIndex!=sender.tag) {
                [self setBorderForView:searchCell.tab1 withColor:[UIColor lightGrayColor]];
                [self setBorderForView:searchCell.tab2 withColor:blueColor];
                [self setBorderForView:searchCell.tab3 withColor:[UIColor lightGrayColor]];
                searchCell.tab1Main.textColor = [UIColor lightGrayColor];
                searchCell.tab1Sub.textColor = [UIColor lightGrayColor];
                searchCell.tab2Main.textColor = blueColor;
                searchCell.tab2Sub.textColor = [UIColor colorWithRed:54.0/255.0 green:142.0/255.0 blue:244.0/255.0 alpha:1];
                searchCell.tab3Main.textColor = [UIColor lightGrayColor];
                searchCell.tab3Sub.textColor = [UIColor lightGrayColor];
                previousIndex = selectedIndex;
                selectedIndex = sender.tag;
                if (previousIndex<selectedIndex) {
                    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
                }else
                {
                    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
                }
                
            }
        }
            break;
        case 2:
        {
            if (selectedIndex!=sender.tag) {
                [self setBorderForView:searchCell.tab1 withColor:[UIColor lightGrayColor]];
                [self setBorderForView:searchCell.tab2 withColor:[UIColor lightGrayColor]];
                [self setBorderForView:searchCell.tab3 withColor:blueColor];
                searchCell.tab1Main.textColor = [UIColor lightGrayColor];
                searchCell.tab1Sub.textColor = [UIColor lightGrayColor];
                searchCell.tab2Main.textColor = [UIColor lightGrayColor];
                searchCell.tab2Sub.textColor = [UIColor lightGrayColor];
                searchCell.tab3Main.textColor = blueColor;
                searchCell.tab3Sub.textColor = blueColor;
                previousIndex = selectedIndex;
                selectedIndex = sender.tag;
                [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
            }
        }
            break;
            
        default:
            break;
    }
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
    [circleLayer setStrokeColor:[UIColor lightGrayColor].CGColor];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
