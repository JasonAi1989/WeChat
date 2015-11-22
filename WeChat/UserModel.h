//
//  UserModel.h
//  WeChat
//
//  Created by jason on 15/11/22.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface UserModel : NSObject

@property (nonatomic, copy) NSMutableString *country;
@property (nonatomic, copy) NSMutableString *fullName;
@property (nonatomic, copy) NSMutableString *phoneNumber;
@property (nonatomic, copy) NSMutableString *pwd;

@end
