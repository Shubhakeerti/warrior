//
//  DoctorDetailViewController.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "DoctorDetailViewController.h"
#import "TMCell.h"
#import "Utils.h"

@interface DoctorDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *doctorTableView;
@property (nonatomic, strong) NSMutableArray *terManagerArray;

@end

@implementation DoctorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Doclist_json (1)" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    self.terManagerArray = [[NSMutableArray alloc] initWithArray:[json objectForKey:@"TSM"]];
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Doclist_json" ofType:@"txt"];
//    NSData *data = [NSData dataWithContentsOfFile:filePath];
//    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//    self.terManagerArray = [[NSMutableArray alloc] initWithArray:json];
    [self.doctorTableView reloadData];
    // Do any additional setup after loading the view.
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
    
//    cell.terManagerSalesCount.text = [NSString stringWithFormat:@"%@",[[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"total_count"]];
    cell.terManagerSalesCount.hidden = YES;
    cell.rankingImageView.hidden = YES;
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

- (IBAction)backAction:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{}];
}
@end
