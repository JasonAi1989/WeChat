//
//  Message+CoreDataProperties.h
//  WeChat
//
//  Created by jason on 15/11/22.
//  Copyright © 2015年 JasonAi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface Message (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) Client *client;

@end

NS_ASSUME_NONNULL_END
