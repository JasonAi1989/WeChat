//
//  LocalUserCheckIn.m
//  WeChat
//
//  Created by jason on 15/11/18.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "LocalUserCheckIn.h"


@implementation LocalUserCheckIn

singleton_implementation(LocalUserCheckIn);

-(BOOL)checkUser:(NSString*)user Password:(NSString*)pwd{
    [self loadLocalUser];
    
    if ([_userName isEqualToString:user] && [_pwd isEqualToString:pwd]) {
        return true;
    }
    else
        return false;
}

-(BOOL)saveUser:(NSString*)user Password:(NSString*)pwd{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, true) lastObject];
    NSString *path=[documents stringByAppendingString:@"WeChatUser.arc"];
    
    if (user == nil || pwd == nil) {
        return false;
    }
    
    NSArray *array=@[user,pwd];
    if(![NSKeyedArchiver archiveRootObject:array toFile:path]){
        NSLog(@"archiver failed!");
        return false;
    }
    
    [self loadLocalUser];
    
    return true;
}

-(BOOL)isUser{
    [self loadLocalUser];
    
    if (_userName != nil && _pwd != nil) {
        return true;
    }
    else
        return false;
}

-(void)loadLocalUser{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, true) lastObject];
    NSString *path=[documents stringByAppendingString:@"WeChatUser.arc"];
    
    //NSArray解档
    NSArray *array=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (array == nil) {
        return;
    }
    
    if (_userName == nil) {
        _userName = [[NSMutableString alloc]initWithString:array[0]];
    }
    else if ([_userName isEqualToString:array[0]] == false)
    {
        [_userName setString:array[0]];
    }
    
    if (_pwd == nil) {
        _pwd = [[NSMutableString alloc]initWithString:array[1]];
    }
    else if ([_pwd isEqualToString:array[1]] == false)
    {
        [_pwd setString:array[1]];
    }
}
@end
