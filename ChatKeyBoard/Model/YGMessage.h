//
//  YGMessage.h
//  ChatKeyBoard
//
//  Created by 叶根长 on 15/6/16.
//  Copyright (c) 2015年 叶根长. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YGSender;
@interface YGMessage : NSObject
@property(nonatomic,copy) NSString *text;
@property(nonatomic,strong) YGSender *sender;
@end
