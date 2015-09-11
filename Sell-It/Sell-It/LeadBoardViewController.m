//
//  SecondViewController.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 11/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "LeadBoardViewController.h"
#import "TMCell.h"
#import <CoreImage/CoreImage.h>
#import <UIImageView+WebCache.h>


@interface LeadBoardViewController ()
@property (weak, nonatomic) IBOutlet UITableView *terManagerTableView;
@property (nonatomic, strong) NSMutableArray *terManagerArray;
@property (nonatomic,strong) NSArray *colorArray;
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
    cell.terManagerImageView.image = [self settingImageForContactsWithName:cell.terManagerNameLabel.text withKey:cell.terManagerNameLabel.text];
    [self cropViewCircle:cell.terManagerImageView];
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

-(UIImage*)settingImageForContactsWithName:(NSString*)name withKey:(NSString *)key{
    
    if (self.colorArray == nil || self.colorArray.count == 0)
    {
        [self setColorArray:[[NSArray alloc]initWithObjects:@"#33b679",@"#536173",@"#855e86",@"#df5948",@"#aeb857",@"#547bca",@"#ae6b23",@"#e5ae4f", nil]];
    }
    UIImage *image;
    if ([[SDImageCache sharedImageCache]diskImageExistsWithKey:key])
    {
        image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
        if (image)
        {
            return image;
        }
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    //    label.font = [UIFont boldSystemFontOfSize:30];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:50];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    NSInteger integer = abs(arc4random())%7;
    NSString *randonColorHexString = [self.colorArray objectAtIndex:integer];
    label.backgroundColor = [self colorWithHexString:randonColorHexString andAlpha:1.0f];
    label.text = [[name substringToIndex:1] uppercaseString];
    UIGraphicsBeginImageContext([label bounds].size);
    [[label layer] renderInContext: UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[SDWebImageManager sharedManager] saveImageToCache:image forURL:[NSURL URLWithString:key]];
    return image;
}

-(UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha {
    UIColor *col;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
    uint hexValue;
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
        col = [self colorWithHexValue:hexValue andAlpha:alpha];
    } else {
        col = [UIColor clearColor];
    }
    return col;
}

-(UIColor *)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alpha];
}

-(void)cropViewCircle:(UIImageView *)view
{
    CALayer *imageLayer = view.layer;
    [imageLayer setCornerRadius:view.frame.size.width/2];
    [imageLayer setMasksToBounds:YES];
    imageLayer = nil;
}

@end
