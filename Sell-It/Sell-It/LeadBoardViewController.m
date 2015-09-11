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


@interface LeadBoardViewController ()
@property (weak, nonatomic) IBOutlet UITableView *terManagerTableView;
@property (nonatomic, strong) NSMutableArray *terManagerArray;
@end

@implementation LeadBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TMLeaderboard_json" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    self.terManagerArray = [[NSMutableArray alloc] initWithArray:[json objectForKey:@"TM"]];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
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
    cell.terManagerNameLabel.text = [[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
    cell.terManagerLoaclityLabel.text = [[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"loc"];
    cell.terManagerImageView.image = [Utils settingImageForContactsWithName:cell.terManagerNameLabel.text withKey:cell.terManagerNameLabel.text];
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


@end
