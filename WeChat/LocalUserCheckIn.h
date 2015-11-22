//
//  LocalUserCheckIn.h
//  WeChat
//
//  Created by jason on 15/11/18.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "UserModel.h"

@interface LocalUserCheckIn : NSObject{
    UserModel* _localUser;
}

singleton_interface(LocalUserCheckIn);

-(BOOL)checkUser:(UserModel*)user;
-(BOOL)saveUser:(UserModel*)user;
-(BOOL)isUser;

@end
