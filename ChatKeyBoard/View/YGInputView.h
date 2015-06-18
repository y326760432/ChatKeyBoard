//
//  YGInputView.h
//  ChatKeyBoard
//
//  Created by 叶根长 on 15/6/16.
//  Copyright (c) 2015年 叶根长. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kKeyBorad_H 45
@interface YGInputView : UIView
+(YGInputView *)view;
@property(nonatomic,copy) void(^heightChange)(CGFloat height);
@end