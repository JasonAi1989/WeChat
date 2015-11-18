//
//  SignUpViewController.m
//  WeChat
//
//  Created by jason on 15/11/17.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()  //<UITableViewDataSource>
{
    UILabel *_topLabel;
    UIButton *_iconButtn;
    UILabel *_fullNameLabel;
    UITextField *_fullNameText;
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
    self.navigationController.navigationBar.hidden = false;
    
    _topLabel = [[UILabel alloc]init];
    [_topLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"FullNameRect"]]];
    [_topLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_topLabel];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_topLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_topLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-70]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_topLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_topLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:70]];
    
    _fullNameLabel = [[UILabel alloc]init];
    _fullNameLabel.text = @"Full Name";
    [_fullNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_topLabel addSubview:_fullNameLabel];
    [_topLabel addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_topLabel attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15]];
    [_topLabel addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_topLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:27]];
    
    _fullNameText = [[UITextField alloc]initWithFrame:CGRectMake(200, 300, 150, 20)];
    _fullNameText.placeholder = @"John Appleseed";
    [self.view addSubview:_fullNameText];
//    [_fullNameText setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [_topLabel addSubview:_fullNameText];
//    [_topLabel addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameText attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_topLabel attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100]];
//    [_topLabel addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameText attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_topLabel attribute:NSLayoutAttributeRight multiplier:1.0 constant:100]];
//    [_topLabel addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameText attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_topLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:27]];
//    [_topLabel addConstraint:[NSLayoutConstraint constraintWithItem:_fullNameText attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_topLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20]];
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 3;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}
@end
