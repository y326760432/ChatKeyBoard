//
//  YGInputView.h
//  ChatKeyBoard
//
//  Created by 叶根长 on 15/6/16.
//  Copyright (c) 2015年 叶根长. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kKeyBorad_H 45

@class YGInputView;

@protocol YGInputViewDelegate <NSObject>

/**
 *输入视图发生改变
 */
-(void)inputViewHeightChange:(YGInputView *)inputview height:(CGFloat)height;

@end

@interface YGInputView : UIView
+(YGInputView *)view;
@property(nonatomic,copy) void(^heightChange)(CGFloat height);
@property(nonatomic,weak) id<YGInputViewDelegate> delegate;
@end