//
//  WeChatNavigationBar.m
//  WeChat
//
//  Created by jason on 15/11/22.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "WeChatNavigationBar.h"

@implementation WeChatNavigationBar

-(WeChatNavigationBar*)init{
    self = [super init];
    
    self.hidden = false;
    self.translucent = false;
    NSLog(@"here");
    return self;
}

-(void)navigationBarLayout
{
    self.hidden = false;
    self.translucent = false;
}

@end
