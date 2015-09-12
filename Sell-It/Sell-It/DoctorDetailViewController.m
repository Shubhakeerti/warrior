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
-(void)initWithDoctorDetails:(NSString *)strTarget
{
    target=strTarget;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Doclist_json (1)" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    self.terManagerArray = [[NSMutableArray alloc] initWithArray:[json objectForKey:@"TSM"]];*/
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Doclist_json" ofType:@"txt"];
//    NSData *data = [NSData dataWithContentsOfFile:filePath];
//    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//    self.terManagerArray = [[NSMutableArray alloc] initWithArray:json];
    [self.doctorTableView reloadData];
    
    [self.btnStatus setTitle:target forState:UIControlStateNormal]; // To set the title
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    AppDelegate * appdelegate = [[UIApplication sharedApplication]delegate];

    self.terManagerArray=[[NSMutableArray alloc] initWithArray:[appdelegate.terManagerArray1 mutableCopy]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int temp=0;
    NSString *tag;
    if([target isEqualToString:@"Docotor to completed"])
    {
        tag=@"0";
    }
    else if([target isEqualToString:@"Docotor to complete"])
    {
        tag=@"1";
    }else if([target isEqualToString:@"Docotor to process"])
    {
        tag=@"2";
    }else
    {
        tag=@"3";
    }
    AppDelegate * appdelegate = [[UIApplication sharedApplication]delegate];
    for(int i=0;i<8;i++)
    {
        NSDictionary *tem=[[NSDictionary alloc] initWithDictionary:[appdelegate.terManagerArray1 objectAtIndex:i]];
        if([[tem objectForKey:@"flag"] isEqualToString:tag]){
            temp=temp+1;
        }

    }
    return temp;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMCell* cell = (TMCell*)[tableView dequeueReusableCellWithIdentifier:@"TMCell"];
    if (cell == nil) {
        cell = [[TMCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TMCell"];
    }
    if(![cell.btnClaim.titleLabel.text isEqualToString:@"Doctor to complete"])
    {
        cell.btnClaim.titleLabel.text=nil;
    }
    cell.terManagerNameLabel.text = [[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
    cell.terManagerLoaclityLabel.text = [[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"loc"];
    
    cell.terManagerImageView.image = [Utils settingImageForContactsWithName:cell.terManagerNameLabel.text withKey:cell.terManagerNameLabel.text];
    
//    cell.terManagerSalesCount.text = [NSString stringWithFormat:@"%@",[[self.terManagerArray objectAtIndex:indexPath.row] objectForKey:@"total_count"]];
    cell.terManagerSalesCount.hidden = YES;
    cell.rankingImageView.hidden = YES;
    [Utils cropViewCircle:cell.terManagerImageView];
    
    
    [cell.btnClaim addTarget:self action:@selector(doctorAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnClaim.tag = indexPath.row;
    
    return cell;
}
- (IBAction)doctorAction:(id)sender {
    iss=(int)((UIButton *)sender).tag;
    
    UIAlertView *myAlert = [[UIAlertView alloc]
                            initWithTitle:@"Congrats"
                            message:@"Request Success"
                            delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok",nil];
    [myAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AppDelegate * appdelegate = [[UIApplication sharedApplication]delegate];
    NSMutableArray *tarr=[[NSMutableArray alloc] init];
    
    for(int i=0;i<8;i++)
    {
        NSDictionary *tem=[[NSDictionary alloc] initWithDictionary:[appdelegate.terManagerArray1 objectAtIndex:i]];
        NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        [dict setObject:[tem objectForKey:@"Name"] forKey:@"Name"];
        [dict setObject:[tem objectForKey:@"lat"] forKey:@"lat"];
        [dict setObject:[tem objectForKey:@"long"] forKey:@"long"];
        [dict setObject:@"2" forKey:@"flag"];
        
        [tarr addObject:dict];
    }
    
    appdelegate.terManagerArray1=[[NSMutableArray alloc] initWithArray:[tarr mutableCopy]];

    
    [self backAction:self];
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
