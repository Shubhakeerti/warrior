//
//  SecondViewController.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "LeadBoardViewController.h"
#import "TMCell.h"
#import "Utils.h"
#import "HTTPConnectoin.h"
#import <UIImageView+WebCache.h>


@interface LeadBoardViewController ()<HttpDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITableView *terManagerTableView;
@property (nonatomic, strong) NSMutableArray *terManagerArray;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentView;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UIView *blurrView;
@property(nonatomic,strong) NSString *time;
@property (nonatomic,strong)NSString *page;
@property BOOL isloadMore;
@property (nonatomic,strong)NSMutableDictionary *rankingDict;

@end

@implementation LeadBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    self.blurrView.hidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.terManagerArray = [[NSMutableArray alloc]init];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    self.navigationItem.title = @"Leader Board";
    self.page = @"1";
    NSShadow* shadow = [NSShadow new];
    shadow.shadowOffset = CGSizeMake(0.0f, 1.0f);
    shadow.shadowColor = [UIColor redColor];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    [HTTPConnectoin getSharedInstance].delegate = self;
    self.rankingDict = [[NSMutableDictionary alloc] init];
    [self.timeButton setTintColor:[UIColor colorWithRed:54.0/255.0 green:142.0/255.0 blue:244.0/255.0 alpha:1.0]];
    self.time = @"current_week";
    [self.timeButton setTitle:@"This Week" forState:UIControlStateNormal];
    [self.timeButton addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventTouchUpInside];
    
    UIFont *font = [UIFont boldSystemFontOfSize:12.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:NSFontAttributeName];
    [self.segmentView setTitleTextAttributes:attributes
                                    forState:UIControlStateNormal];
    [self.segmentView addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [self.segmentView setTintColor:[UIColor colorWithRed:54.0/255.0 green:142.0/255.0 blue:244.0/255.0 alpha:1.0]];
    [self doAPICall:0];
    self.isloadMore = NO;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [self.navigationController.navigationItem setHidesBackButton:YES animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.terManagerArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMCell* cell = (TMCell*)[tableView dequeueReusableCellWithIdentifier:@"TMCell"];
    if (cell == nil) {
        cell = [[TMCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TMCell"];
    }
    cell.terManagerNameLabel.text = [[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.terManagerLoaclityLabel.text = [[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"sales_city"];
    NSURL *urlString =[NSURL URLWithString:[NSString stringWithFormat:@"https://accounts.practo.com/profile_picture/%@/medium_thumbnail",[[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"claimed_sales_user_id"]]];
    [cell.terManagerImageView sd_setImageWithURL:urlString placeholderImage:[Utils settingImageForContactsWithName:cell.terManagerNameLabel.text withKey:cell.terManagerNameLabel.text] options:SDWebImageRetryFailed];
    cell.terManagerSalesCount.text = [NSString stringWithFormat:@"%@",[[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"total_count"]];
    cell.rankingImageView.image = [self getRandomImageForIndexPath:[[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"claimed_sales_user_id"]];
    [Utils cropViewCircle:cell.terManagerImageView];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    return view;
}

-(void)getResponseCode:(NSInteger)responseCode withResponse:(NSDictionary *)response
{
    if (!self.isloadMore)
    {
        [self.terManagerArray removeAllObjects];
    }
    [self.terManagerArray addObjectsFromArray:[response objectForKey:@"leaderboard"] ];
    NSLog(@"%@",response);
    [self.terManagerTableView reloadData];
    [self.blurrView setHidden:YES];
    self.isloadMore = NO;
}

-(void)segmentChanged:(UISegmentedControl*)sender
{
    [self doAPICall:sender.selectedSegmentIndex];
}
-(void)doAPICall:(int)index
{
    self.blurrView.hidden = NO;
    NSString *serviceName;
    NSString *type;
    switch (index) {
        case 0:
            serviceName = @"Ray";
            type = @"hunting";
            break;
        case 1:
            serviceName = @"Ray";
            type = @"farming";
            break;
        case 2:
            serviceName = @"Fabric%20Ad";
            type = nil;
            break;
        case 3:
            serviceName = @"Communicator%20SMS";
            type = nil;
            break;
            
        default:
            break;
    }
    NSString *urlString;
    if (type!=nil)
    {
        urlString = [NSString stringWithFormat:@"https://epicenter.practo.com/api/v1/claimedpaymentreport?service_name=%@&sale_type=%@&time_range=%@&page=%@&include_pending_payments=true&with_recent_sale_getters=true",serviceName,type,self.time,self.page];
    }
    else
    {
        urlString = [NSString stringWithFormat:@"https://epicenter.practo.com/api/v1/claimedpaymentreport?service_name=%@&time_range=%@&page=%@&include_pending_payments=true&with_recent_sale_getters=true",serviceName,self.time,self.page];
    }
    [[HTTPConnectoin getSharedInstance] initializeHttpConnection:@"LeadBoard" withParams:nil withUrl:urlString withMethodType:GET withAuth:@"bf307e030b06cab814c0d6ae817f9125e6d74a01"];
}

-(void)changeDate:(UIButton *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"This Week", @"This Month", @"This Quater",@"All", nil];
    
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex)
    {
        case 0:
            self.time = @"current_week";
            [self.timeButton setTitle:@"This Week" forState:UIControlStateNormal];
            break;
        case 1:
            self.time = @"current_month";
            [self.timeButton setTitle:@"This Month" forState:UIControlStateNormal];
            break;
        case 2:
            self.time = @"current_quarter";
            [self.timeButton setTitle:@"This Quarter" forState:UIControlStateNormal];
            break;
        case 3:
            self.time = @"all";
            [self.timeButton setTitle:@"All" forState:UIControlStateNormal];
            break;
        default:
            return;
            break;
    }
    [self doAPICall:[self.segmentView selectedSegmentIndex]];
}

#pragma mark Scroll View Delegates
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //load more logic
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    float reload_distance = -20;
    if(y >= h + reload_distance) {
        if (!self.isloadMore)
        {
            self.isloadMore = YES;
            NSInteger pageInteger = self.page.integerValue;
            self.page = [NSString stringWithFormat:@"%d",pageInteger+1];
            [self doAPICall:[self.segmentView selectedSegmentIndex]];
        }
    }
}

-(UIImage*)getRandomImageForIndexPath:(NSString*)terManagerId
{
    int integer;
    if ([self.rankingDict objectForKey:terManagerId])
    {
        integer = [[self.rankingDict objectForKey:terManagerId] intValue];
    }
    else
    {
        integer= (arc4random())%3;
        [self.rankingDict setObject:[NSString stringWithFormat:@"%d",integer] forKey:terManagerId];
    }
    
    switch (integer) {
        case 0:
            
            return [UIImage imageNamed:@"Up_Arrow_green.png"];
            break;
        case 1:
            return [UIImage imageNamed:@"Down_arrow_Red.png"];
            break;
        case 2:
            return nil;
            break;
            
        default:
            return nil;
            break;
    }
}

@end
