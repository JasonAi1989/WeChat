//
//  ChatsCell.m
//  WeChat
//
//  Created by jason on 15/11/22.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "ChatsCell.h"
#import "Client+CoreDataProperties.h"
#import "Message+CoreDataProperties.h"


#define WCColor(r,g,b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1] //颜色宏定义
#define WCTableViewCellBackgroundColor WCColor(251,251,251)
#define WCGrayColor WCColor(50,50,50)
#define WCBlackColor WCColor(0,0,0)
#define WCLightGrayColor WCColor(120,120,120)

#define WCTableViewCellUserNameFontSize 14
#define WCTableViewCellAvatarWidth 40 //头像宽度
#define WCTableViewCellAvatarHeight WCTableViewCellAvatarWidth
#define WCTableViewCellControlSpacing 10 //控件间距

@interface ChatsCell ()
{
    UIImageView *_iconImage;
    UILabel *_nameLabel;
    UILabel *_detailLabel;
    UILabel *_dateLabel;
}
@end

@implementation ChatsCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initSubview];
    }
    
    return self;
}

- (void)initSubview{
    //头像
    _iconImage = [[UIImageView alloc]init];
    [self addSubview:_iconImage];
    
    //用户名
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = WCBlackColor;
    _nameLabel.font = [UIFont systemFontOfSize:WCTableViewCellUserNameFontSize];
    [self addSubview:_nameLabel];
    
    //详细信息
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.textColor = WCGrayColor;
    _detailLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_nameLabel];
    
    //日期
    _dateLabel = [[UILabel alloc]init];
    _dateLabel.textColor = WCGrayColor;
    _dateLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_dateLabel];
}

-(void)setChatsCell:(Client *)chatsCell{
    //设置头像
    CGFloat icon_x =10, icon_y = 10;
    CGRect rect = CGRectMake(icon_x, icon_y, WCTableViewCellAvatarWidth, WCTableViewCellAvatarHeight);
    _iconImage.image = [UIImage imageNamed:chatsCell.iconImageURL];
    _iconImage.frame = rect;
    
    //name
    CGFloat userNameX= CGRectGetMaxX(_iconImage.frame)+WCTableViewCellControlSpacing;
    CGFloat userNameY=icon_y;
    CGRect rectName = CGRectMake(userNameX, userNameY, 50, 20);
    _nameLabel.text = chatsCell.clientName;
    _nameLabel.frame = rectName;
    
    //detail
    _detailLabel.text = [chatsCell.messages lastObject].content;
    
    //date
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = @"yy/MM/dd";
    _dateLabel.text =  [formater stringFromDate:[chatsCell.messages lastObject].date];
}
@end
