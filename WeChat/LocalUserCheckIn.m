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


-(BOOL)checkUser:(UserModel*)user{
    [self loadLocalUser];
    
    if ([_localUser.country isEqualToString:user.country]
        && [_localUser.phoneNumber isEqualToString:user.phoneNumber]
        && [_localUser.pwd isEqualToString:user.pwd]) {
        return true;
    }
    else
    {
        return false;
    }
}

-(BOOL)saveUser:(UserModel*)user{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, true) lastObject];
    NSString *path=[documents stringByAppendingString:@"WeChatUser.arc"];
//    NSLog(@"save path: %@", path);
    
    if (user == nil) {
        return false;
    }
    
    NSArray *array=@[user.country, user.fullName, user.phoneNumber, user.pwd];
    if(![NSKeyedArchiver archiveRootObject:array toFile:path]){
        NSLog(@"archiver failed!");
        return false;
    }
    
    [self loadLocalUser];
    
    return true;
}

-(BOOL)isUser{
    [self loadLocalUser];
    
    if (_localUser == nil
        || _localUser.phoneNumber == nil
        || _localUser.pwd == nil) {
        return false;
    }
    else
        return true;
}

-(void)loadLocalUser{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, true) lastObject];
    NSString *path=[documents stringByAppendingString:@"WeChatUser.arc"];
//    NSLog(@"load path: %@", path);
    
    //NSArray解档
    NSArray *array=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (array == nil) {
        return;
    }

    if (_localUser == nil) {
        _localUser = [[UserModel alloc]init];
    }
    
    if (_localUser.country == nil) {
        _localUser.country = [[NSMutableString alloc] initWithString:array[0]];
    }
    else if ([_localUser.country isEqualToString:array[0]] == false)
    {
        [_localUser.country setString:array[0]];
    }
    
    if (_localUser.fullName == nil) {
        _localUser.fullName = [[NSMutableString alloc]initWithString:array[1]];
    }
    else if ([_localUser.fullName isEqualToString:array[1]] == false)
    {
        [_localUser.fullName setString:array[1]];
    }

    if (_localUser.phoneNumber == nil) {
        _localUser.phoneNumber = [[NSMutableString alloc]initWithString:array[2]];
    }
    else if ([_localUser.phoneNumber isEqualToString:array[2]] == false)
    {
        [_localUser.phoneNumber setString:array[2]];
    }
    
    if (_localUser.pwd == nil) {
        _localUser.pwd = [[NSMutableString alloc]initWithString:array[3]];
    }
    else if ([_localUser.pwd isEqualToString:array[3]] == false)
    {
        [_localUser.pwd setString:array[3]];
    }
}
@end
