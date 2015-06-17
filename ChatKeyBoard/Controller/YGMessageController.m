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
@interface YGMessageController ()<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property(nonatomic,strong) YGInputView *Inputview;
@end

@implementation YGMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
//    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50-64)];
//    self.tableView.delegate=self;
//    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    
    [self addInputView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout=UIRectEdgeNone;
}

-(void)addInputView
{
    YGInputView *view=[[YGInputView alloc]initWithFrame:CGRectMake(0, 84, kSELF_VIEW_SIZE.width, 50)];
    [self.view addSubview:view];
    self.Inputview=view;
    
}

#pragma mark UITableView代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
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

@end
