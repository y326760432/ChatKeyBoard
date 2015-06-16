//
//  YGInputView.m
//  ChatKeyBoard
//
//  Created by 叶根长 on 15/6/16.
//  Copyright (c) 2015年 叶根长. All rights reserved.
//

#import "YGInputView.h"

@implementation YGInputView

+(YGInputView *)view
{
    YGInputView *view=[[UINib nibWithNibName:@"YGInputView" bundle:nil] instantiateWithOwner:nil options:nil][0];
    return view;
}
- (IBAction)sendmsg:(id)sender {
   
}

@end
