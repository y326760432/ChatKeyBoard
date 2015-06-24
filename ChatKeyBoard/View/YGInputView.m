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
#define kMaxHeight 80 //输入视图最大高度
#define kMinHeight (kItem_H+kPanding*2)// 输入视图最小高度
@interface YGInputView ()<UITextViewDelegate>
{
    
}
@property(nonatomic,strong) UITextView *tfcontent;
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
        self.backgroundColor=[UIColor colorWithRed:0.949 green:0.949 blue:0.961 alpha:1.000];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    if(frame.size.height>kMaxHeight)
        frame.size.height=kMaxHeight;
    else if (frame.size.height<kMinHeight)
        frame.size.height=kMinHeight;
    [super setFrame:frame];
}

#pragma mark 创建子控件
-(void)createSubItems
{
    UITextView *tfcontext=[[UITextView alloc]init];
    tfcontext.enablesReturnKeyAutomatically=YES; //输入框没有内容时，回车键不可用
    tfcontext.layer.masksToBounds=YES;
    tfcontext.layer.borderColor=[UIColor lightGrayColor].CGColor;
    tfcontext.layer.borderWidth=0.5;
    tfcontext.layer.cornerRadius=5;
    tfcontext.returnKeyType=UIReturnKeySend;
    tfcontext.delegate=self;
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

    self.tfcontent.frame=CGRectMake(kMarginleft+kItem_H+kPanding, 5, kSELF_SIZE.width-(kMarginleft*2+kPanding*3+kItem_H*3), kSELF_SIZE.height-kPanding*2);
    CGFloat item_y=kSELF_SIZE.height-kPanding-kItem_H;
    self.btnvoice.frame=CGRectMake(kMarginleft, item_y, kItem_H, kItem_H);
    self.btnexpression.frame=CGRectMake(CGRectGetMaxX(self.tfcontent.frame)+kPanding, item_y, kItem_H, kItem_H);
    self.btnextend.frame=CGRectMake(CGRectGetMaxX(self.btnexpression.frame)+kPanding, item_y, kItem_H, kItem_H);
}

-(void)textViewDidChange:(UITextView *)textView
{
    //获取文字高度
    CGFloat textheight=[[textView layoutManager]usedRectForTextContainer:[textView textContainer]].size.height+8;
    CGRect selfframe=self.frame;
    CGFloat viewheight=textheight+kPanding*2;
    if(viewheight>kMaxHeight)
        viewheight=kMaxHeight;
    else if (viewheight<kMinHeight)
        viewheight=kMinHeight;
    
    selfframe.origin.y-=viewheight-selfframe.size.height;
    selfframe.size.height=viewheight;
    self.frame=selfframe;
    if(self.delegate&&[self.delegate respondsToSelector:@selector(inputViewHeightChange:height:)])
    {
        [self.delegate inputViewHeightChange:self height:viewheight];
    }
}



- (CGSize)boundingRectWithString:(NSString *)str Size:(CGSize)size font:(UIFont *)font
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize retSize = [str boundingRectWithSize:size
                                             options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}

#pragma mark 语音按钮被点击
-(void)btnVoiceClick:(UIButton *)button
{
    NSLog(@"点击语音按钮");
}

#pragma mark 表情按钮被点击
-(void)btnExpressionClick:(UIButton *)button
{
    NSLog(@"点击表情按钮");
}

-(void)btnExtendClick:(UIButton *)button
{
    NSLog(@"点击扩展按钮");
}



@end
