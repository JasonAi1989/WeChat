//
//  LaunchViewController.m
//  WeChat
//
//  Created by jason on 15/11/16.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "LaunchViewController.h"
#import "LocalUserCheckIn.h"

@interface LaunchViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *logInBtn;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;

@end

@implementation LaunchViewController

#pragma mark 每次显示此页面，这个方法都会被调用
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = true;
}

- (void)viewDidAppear:(BOOL)animated{
    [self localUserCheckInAndUILayout];
}

#pragma mark 好像只有在第一次显示此页面时，会调用此方法，与上面这个方法不一样。
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self UILayout];

    [self localUserCheckInAndUILayout];
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

#pragma mark 自定义方法
- (void)UILayout{
    self.imageView.image = [UIImage imageNamed:@"LaunchImage"];
    self.navigationController.navigationBar.hidden = true;
}

-(void)localUserCheckInAndUILayout{
    [self buttonHide:true];
    
    if ([self localUserCheckIn] == false) {
        [self buttonHide:false];
    }
    else
    {
        //"gotoMainViewController" 是segue的Identifier,在storyBoard上将两个界面直接连接，然后命名segue，此处则是调用此segue
        [self performSegueWithIdentifier:@"gotoMainViewController" sender:self];
        
        // 这种方式是不通过storyBoard去自动显示下一个界面的方式
        //    UIViewController *secondview=[[UITabBarController alloc]init];
        //    [self.navigationController pushViewController:secondview animated:YES];
    }
}

//在本地数据库中进行用户check in
-(BOOL)localUserCheckIn{
    LocalUserCheckIn *user = [LocalUserCheckIn sharedLocalUserCheckIn];

    return [user isUser];
}


-(void)buttonHide:(BOOL) flag{
    if (flag) {
        self.logInBtn.hidden = true;
        self.signUpBtn.hidden = true;
    }
    else
    {
        self.logInBtn.hidden = false;
        self.signUpBtn.hidden = false;
    }
}

#pragma mark 重写方法
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"logIn"])
    {
        NSLog(@"here");
    }
}
@end
