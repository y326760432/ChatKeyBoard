//
//  YGMessageController.m
//  ChatKeyBoard
//
//  Created by 叶根长 on 15/6/16.
//  Copyright (c) 2015年 叶根长. All rights reserved.
//

#import "YGMessageController.h"
#import "YGGlobalHeader.h"
#import "YGInputView.h"
@interface YGMessageController ()<UITableViewDataSource,UITableViewDelegate,YGInputViewDelegate>
{
    
}
@property(nonatomic,strong) YGInputView *Inputview;
@end

@implementation YGMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithWhite:0.902 alpha:1.000];
    [self.view addSubview:self.tableView];
    [self addInputView];
    UITableView *tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-kKeyBorad_H-64)];
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    self.tableView=tableview;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}


#pragma mark 监听键盘即将出现通知
-(void)keyBoardChangeFrame:(NSNotification *)notification
{
    //获取动画时长
    CGFloat duration=[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //获取键盘高度
    CGFloat keyborad_y=[notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y ;

    [UIView animateWithDuration:duration animations:^{
        CGRect tableframe=self.tableView.frame;
        CGRect inputviewframe=self.Inputview.frame;
        tableframe.origin.y=(keyborad_y-kKeyBorad_H-20)-kSELF_VIEW_SIZE.height;
        self.tableView.frame=tableframe;
        inputviewframe.origin.y=keyborad_y-kKeyBorad_H-64;
        self.Inputview.frame=inputviewframe;
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:19 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        
    }];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout=UIRectEdgeNone;
}

#pragma mark 添加输入视图
-(void)addInputView
{
    YGInputView *view=[[YGInputView alloc]initWithFrame:CGRectMake(0, kSELF_VIEW_SIZE.height-kKeyBorad_H-64, kSELF_VIEW_SIZE.width, kKeyBorad_H)];
    view.delegate=self;
    [self.view addSubview:view];
    self.Inputview=view;
    
}

#pragma mark 输入视图代理方法

#pragma mark 输入视图高度发生改变
-(void)inputViewHeightChange:(YGInputView *)inputview height:(CGFloat)height
{
    
    CGRect inputviewframe=self.Inputview.frame;
    
//    CGFloat height2=inputviewframe.size.height-height;
//    inputviewframe.size.height=height;
//    inputviewframe.origin.y+=height2;
//    
//    self.Inputview.frame=inputviewframe;
//    
//    CGRect tableviewframe=self.tableView.frame;
//    tableviewframe.origin.y+=height2;
//    self.tableView.frame=tableviewframe;
}


#pragma mark UITableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"CELL";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    [self.view endEditing:YES];
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.view endEditing:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
