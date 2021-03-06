//
//  ChatsTableTableViewController.m
//  WeChat
//
//  Created by jason on 15/11/12.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "ChatsTableTableViewController.h"
#import "ChatsCell.h"
#import "Client+CoreDataProperties.h"
#import "Message+CoreDataProperties.h"

@interface ChatsTableTableViewController ()
{
    NSArray *_clients;
}

@end

@implementation ChatsTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self UILayout];
    
    [self addClient];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 自定义方法
-(void)UILayout{
    self.navigationItem.title = @"WeChat";
    
    UIBarButtonItem *search = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStyleDone target:self action:@selector(search)];
    search.tintColor = [UIColor whiteColor]; //如果不写这句话，默认颜色是蓝色
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStyleDone target:self action:@selector(add)];
    add.tintColor = [UIColor whiteColor];
    
    NSArray *array = @[add, search];
    self.navigationItem.rightBarButtonItems = array;
}

-(void)addClient{
    Client *cli = [[Client alloc]init];
    cli.clientName = @"Jason";
    cli.iconImageURL = @"she";
    Message *mes = [[Message alloc]init];
    mes.content = @"Hello, Jason!";
    mes.date = [NSDate date];
    mes.client = cli;
    [cli addMessagesObject:mes];
}

#pragma mark action
-(void)search{

}

-(void)add{

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identtityKey=@"Chats";
    ChatsCell *cell=[self.tableView dequeueReusableCellWithIdentifier:identtityKey];
    if(cell==nil){
        cell=[[ChatsCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identtityKey];
    }
    cell.chatsCell=_clients[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
