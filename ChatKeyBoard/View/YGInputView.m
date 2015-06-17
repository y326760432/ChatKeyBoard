//
//  YGInputView.m
//  ChatKeyBoard
//
//  Created by 叶根长 on 15/6/16.
//  Copyright (c) 2015年 叶根长. All rights reserved.
//

#import "YGInputView.h"
#import "YGGlobalHeader.h"

#define kMarginleft 2
#define kPanding 5
#define kItem_H 35 //按钮高度
@interface YGInputView ()<UITextFieldDelegate>
{
    
}
@property(nonatomic,strong) UITextField *tfcontent;
@property(nonatomic,strong) UIButton *btnvoice; //语音按钮
@property(nonatomic,strong) UIButton *btnexpression; //表情按钮
@property(nonatomic,strong) UIButton *btnextend; //扩展按钮
@end

@implementation YGInputView

+(YGInputView *)view
{
    YGInputView *view=[[YGInputView alloc]init];
    return view;
}

-(id)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        [self createSubItems];
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

#pragma mark 创建子控件
-(void)createSubItems
{
    UITextField *tfcontext=[[UITextField alloc]init];
    tfcontext.enablesReturnKeyAutomatically=YES; //输入框没有内容时，回车键不可用
    tfcontext.returnKeyType=UIReturnKeySend;
    tfcontext.delegate=self;
    [tfcontext addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:tfcontext];
    self.tfcontent=tfcontext;
    
    //添加语音按钮
    UIButton *btnvoice=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnvoice setBackgroundImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
    [btnvoice setBackgroundImage:[UIImage imageNamed:@"ToolViewInputVoiceHL"] forState:UIControlStateHighlighted];
    [btnvoice addTarget:self action:@selector(btnVoiceClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnvoice];
    self.btnvoice=btnvoice;
    
    //添加表情按钮
    UIButton *btnexpression=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnexpression setBackgroundImage:[UIImage imageNamed:@"ToolViewEmotion"] forState:UIControlStateNormal];
    [btnexpression setBackgroundImage:[UIImage imageNamed:@"ToolViewEmotionHL"] forState:UIControlStateHighlighted];
    [btnexpression addTarget:self action:@selector(btnExpressionClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnexpression];
    self.btnexpression=btnexpression;
    
    //添加扩展按钮
    UIButton *btnextend=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnextend setBackgroundImage:[UIImage imageNamed:@"TypeSelectorBtn_Black"] forState:UIControlStateNormal];
    [btnextend setBackgroundImage:[UIImage imageNamed:@"TypeSelectorBtnHL_Black"] forState:UIControlStateHighlighted];
    [btnextend addTarget:self action:@selector(btnExtendClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnextend];
    self.btnextend=btnextend;

}

#pragma mark 布局子控件
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.tfcontent.frame=CGRectMake(kMarginleft+kItem_H+kPanding, 5, kSELF_SIZE.width-(kMarginleft*2+kPanding*3+kItem_H*3), 40);
    self.btnvoice.frame=CGRectMake(kMarginleft, 5, kItem_H, kItem_H);
    self.btnexpression.frame=CGRectMake(CGRectGetMaxX(self.tfcontent.frame)+kPanding, 5, kItem_H, kItem_H);
    self.btnextend.frame=CGRectMake(CGRectGetMaxX(self.btnexpression.frame)+kPanding, 5, kItem_H, kItem_H);
}

#pragma mark 语音按钮被点击
-(void)btnVoiceClick:(UIButton *)button
{
    
}

#pragma mark 表情按钮被点击
-(void)btnExpressionClick:(UIButton *)button
{
    
}

-(void)btnExtendClick:(UIButton *)button
{
    
}

#pragma mark 监听输入框内容变化
-(void)textFieldChanged:(UITextField *)textField
{
    
}




@end
