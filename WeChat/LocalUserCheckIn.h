//
//  LocalUserCheckIn.h
//  WeChat
//
//  Created by jason on 15/11/18.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface LocalUserCheckIn : NSObject{
    NSMutableString* _userName;
    NSMutableString* _pwd;
}

singleton_interface(LocalUserCheckIn);

-(BOOL)checkUser:(NSString*)user Password:(NSString*)pwd;
-(BOOL)saveUser:(NSString*)user Password:(NSString*)pwd;
-(BOOL)isUser;

@end
