//
//  ViewController.m
//  ChatKeyBoard
//
//  Created by 叶根长 on 15/6/16.
//  Copyright (c) 2015年 叶根长. All rights reserved.
//

#import "ViewController.h"
#import "YGInputView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    YGInputView *view=[YGInputView view];
    view.frame=CGRectMake(0, 100, self.view.frame.size.width, 50);
    [self.view addSubview:view];
}

@end
