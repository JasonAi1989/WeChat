//
//  LogInViewController.m
//  WeChat
//
//  Created by jason on 15/11/16.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()<UITableViewDataSource>{
    UITableView *_tableView;

    UILabel *_countryLabel;
    UILabel *_chinaLabel;
    UILabel *_prefixLabel;
    UITextField *_phoneText;
    UIButton *_accessoryBtn;
    UILabel *_pwdLabel;
    UITextField *_pwdText;
    
    UIButton *_loginBtn;
}

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
    
    //table
    CGRect rect = [UIScreen mainScreen].bounds;
    rect.size.height = 150;
    _tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //0 cell elements
    _countryLabel = [[UILabel alloc]init];
    _countryLabel.text = @"Country/Region";
    
    _chinaLabel = [[UILabel alloc]init];
    _chinaLabel.text = @"China";
    _chinaLabel.textColor = [[UIColor alloc]initWithRed:0 green:216/255.0 blue:0 alpha:1];
    
    [_countryLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_chinaLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //1 cell elements
    _prefixLabel = [[UILabel alloc]init];
    _prefixLabel.text = @"+86";
    
    _phoneText = [[UITextField alloc]init];
    _phoneText.placeholder = @"18301005476";
    
    _accessoryBtn = [[UIButton alloc]init];
    [_accessoryBtn setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [_accessoryBtn addTarget:self action:@selector(accessoryBtnAction:) forControlEvents:UIControlEventTouchDown];
    
    [_prefixLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_phoneText setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_accessoryBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //2 cell elements
    _pwdLabel = [[UILabel alloc]init];
    _pwdLabel.text = @"Password";
    
    _pwdText = [[UITextField alloc]init];
    _pwdText.placeholder = @"Password";
    
    [_pwdLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_pwdText setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //log in button
    _loginBtn = [[UIButton alloc]init];
    [_loginBtn setBackgroundImage:[UIImage imageNamed:@"LogIn2"] forState:UIControlStateNormal];
    [_loginBtn setTitle:@"Log In" forState:UIControlStateNormal];
    UIFont *loginFont = [UIFont systemFontOfSize:18.0];
    _loginBtn.titleLabel.font = loginFont;
    
    [_loginBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_loginBtn];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_loginBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:158]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identify_0 = @"LogIn_0";
    static NSString* identify_1 = @"LogIn_1";
    static NSString* identify_2 = @"LogIn_2";
    
    UITableViewCell *cell = nil;
    
    if (indexPath.row == 0) {
        cell = [_tableView dequeueReusableCellWithIdentifier:identify_0];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify_0];
        }
        
        [cell.contentView addSubview:_countryLabel];
        [cell.contentView addSubview:_chinaLabel];
        
        //必需是父视图调用此方法进行添加操作
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_countryLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_countryLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:11]];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_chinaLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_chinaLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:11]];
    }
    else if (indexPath.row == 1)
    {
        cell = [_tableView dequeueReusableCellWithIdentifier:identify_1];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify_1];
        }
        
        [cell.contentView addSubview:_prefixLabel];
        [cell.contentView addSubview:_phoneText];
        [cell.contentView addSubview:_accessoryBtn];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_prefixLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_prefixLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_phoneText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:130]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_phoneText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_accessoryBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-25]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_accessoryBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
    }
    else if (indexPath.row == 2)
    {
        cell = [_tableView dequeueReusableCellWithIdentifier:identify_2];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify_2];
        }
        
        [cell.contentView addSubview:_pwdLabel];
        [cell.contentView addSubview:_pwdText];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_pwdLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_pwdLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_pwdText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:130]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_pwdText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
    }
    
    return cell;
}

-(void)accessoryBtnAction:(id)sender{
    _phoneText.text = @"";
    _phoneText.placeholder = @"18301005476";
    
    [_tableView reloadData];
}
@end
