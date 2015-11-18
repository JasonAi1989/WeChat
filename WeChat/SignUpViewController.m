//
//  SignUpViewController.m
//  WeChat
//
//  Created by jason on 15/11/17.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "SignUpViewController.h"

#define TOPCELL_HIGHT   70
#define TABLE_HIGHT     150
@interface SignUpViewController ()<UITableViewDataSource>
{
    UILabel *_topLabel;
    UIButton *_iconButtn;
    UILabel *_fullNameLabel;
    UITextField *_fullNameText;
    
    UITableView *_tableView;
    
    UILabel *_countryLabel;
    UILabel *_chinaLabel;
    UILabel *_prefixLabel;
    UITextField *_phoneText;
    UIButton *_accessoryBtn;
    UILabel *_pwdLabel;
    UITextField *_pwdText;
    
    UIButton *_signUpBtn;
}
@end

@implementation SignUpViewController

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
    //navigationBar
    self.navigationController.navigationBar.hidden = false;
    
    _topLabel = [[UILabel alloc]init];
    [_topLabel setBackgroundColor:[UIColor colorWithRed:0 green:216/255.0 blue:0 alpha:1]];
    [_topLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_topLabel];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_topLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_topLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_topLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:TOPCELL_HIGHT-1]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_topLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:TOPCELL_HIGHT]];
    
    _fullNameLabel = [[UILabel alloc]init];
    _fullNameLabel.text = @"Full Name";
    [_fullNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_fullNameLabel];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:35]];
    
    _fullNameText = [[UITextField alloc]init];
    _fullNameText.placeholder = @"John Appleseed";
    [self.view addSubview:_fullNameText];
    [_fullNameText setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_fullNameText];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameText attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:35]];
    
    _iconButtn = [[UIButton alloc]init];
    [_iconButtn setBackgroundImage:[UIImage imageNamed:@"iconButton"] forState:UIControlStateNormal];
    [_iconButtn addTarget:self action:@selector(iconButtonAction:) forControlEvents:UIControlEventTouchDown];
    [_iconButtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_iconButtn];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_iconButtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_iconButtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-75]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_iconButtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_iconButtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:TOPCELL_HIGHT]];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, TOPCELL_HIGHT, [UIScreen mainScreen].bounds.size.width, TABLE_HIGHT) style:UITableViewStylePlain];
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
    
    [_prefixLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_phoneText setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //2 cell elements
    _pwdLabel = [[UILabel alloc]init];
    _pwdLabel.text = @"Password";
    
    _pwdText = [[UITextField alloc]init];
    _pwdText.placeholder = @"Password";
    _pwdText.secureTextEntry = true;
    
    _accessoryBtn = [[UIButton alloc]init];
    [_accessoryBtn setBackgroundImage:[UIImage imageNamed:@"eye_slash"] forState:UIControlStateNormal];
    _accessoryBtn.selected = false;
    [_accessoryBtn addTarget:self action:@selector(accessoryBtnAction:) forControlEvents:UIControlEventTouchDown];
    
    [_pwdLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_pwdText setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_accessoryBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    _signUpBtn = [[UIButton alloc]init];
    [_signUpBtn setBackgroundImage:[UIImage imageNamed:@"LogIn2"] forState:UIControlStateNormal];
    [_signUpBtn setTitle:@"Sign Up" forState:UIControlStateNormal];
    UIFont *loginFont = [UIFont systemFontOfSize:18.0];
    _signUpBtn.titleLabel.font = loginFont;
    [_signUpBtn addTarget:self action:@selector(signUpBtnAction:) forControlEvents:UIControlEventTouchDown];
    [_signUpBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_signUpBtn];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_signUpBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_signUpBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_signUpBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:TOPCELL_HIGHT+TABLE_HIGHT+8]];
}

#pragma mark UITableView dateSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify_0 = @"SignUp_0";
    static NSString * identify_1 = @"SignUp_1";
    static NSString * identify_2 = @"SignUp_2";
    
    UITableViewCell *cell=nil;
    
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
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_prefixLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_prefixLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_phoneText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:130]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_phoneText attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-70]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_phoneText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
    }
    else if (indexPath.row == 2)
    {
        cell = [_tableView dequeueReusableCellWithIdentifier:identify_2];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify_2];
        }
        
        [cell.contentView addSubview:_pwdLabel];
        [cell.contentView addSubview:_pwdText];
        [cell.contentView addSubview:_accessoryBtn];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_pwdLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_pwdLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_pwdText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:130]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_pwdText attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-70]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_pwdText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_accessoryBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-25]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_accessoryBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:12]];
    }
    
    return cell;
}

#pragma mark 动作方法
-(void)iconButtonAction:(id)sender{
    NSLog(@"iconButtonAction");
}
-(void)signUpBtnAction:(id)sender{
    NSLog(@"signUpBtnAction");
}
-(void)accessoryBtnAction:(id)sender{
    NSLog(@"accessoryBtnAction");
    
    if (_accessoryBtn.isSelected)
    {
        _accessoryBtn.selected = false;
        [_accessoryBtn setBackgroundImage:[UIImage imageNamed:@"eye_slash"] forState:UIControlStateNormal];
        _pwdText.secureTextEntry = true;
    }
    else
    {
        _accessoryBtn.selected = true;
        [_accessoryBtn setBackgroundImage:[UIImage imageNamed:@"eye"] forState:UIControlStateNormal];
        _pwdText.secureTextEntry = false;
    }
}
@end
