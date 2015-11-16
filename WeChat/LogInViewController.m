//
//  LogInViewController.m
//  WeChat
//
//  Created by jason on 15/11/16.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self UILayout];
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

-(void)UILayout{
    self.navigationController.navigationBar.hidden = false;
    
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identify = @"LogIn";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        
        UILabel *countryLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 13.5, 125.5, 21.5)];
        countryLabel.text = @"Country/Region";
        
//        UILabel *chinaLabel = [[UILabel alloc]initWithFrame:CGRectMake(338.5, 13.5, 46.5, 21.5)];
        UILabel *chinaLabel = [[UILabel alloc]init];
//        CGRect rect = chinaLabel.frame;
//        rect.size = CGSizeMake(46.5, 21.5);
//        chinaLabel.frame = rect;
        chinaLabel.text = @"China";
        chinaLabel.textColor = [[UIColor alloc]initWithRed:0 green:216/255.0 blue:0 alpha:1];
        
        [cell.contentView addSubview:countryLabel];
        [cell.contentView addSubview:chinaLabel];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:chinaLabel attribute:NSLayoutAttributeRightMargin relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRightMargin multiplier:1.0 constant:7]];
//        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:chinaLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20]];
    }
    
    return cell;
}
@end
