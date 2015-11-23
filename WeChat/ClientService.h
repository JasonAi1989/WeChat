//
//  ClientService.h
//  WeChat
//
//  Created by jason on 15/11/22.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Client+CoreDataProperties.h"
#import "Message+CoreDataProperties.h"
#import "Singleton.h"

@interface ClientService : NSObject

singleton_interface(ClientService);

-(void)addClient:(Client*) client;
-(void)addClientWithName:(NSString*)name iconImageURL:(NSString*)url;

-(void)removeClient:(Client*) client;
-(void)removeClientByName:(NSString*) name;

@end
