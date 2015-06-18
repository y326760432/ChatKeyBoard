//
//  GlobalHeader.h
//  ChatKeyBoard
//
//  Created by 叶根长 on 15/6/17.
//  Copyright (c) 2015年 叶根长. All rights reserved.
//

#ifndef ChatKeyBoard_GlobalHeader_h
#define ChatKeyBoard_GlobalHeader_h

#define kSELF_VIEW_SIZE self.view.frame.size
#define kSELF_SIZE self.frame.size
//获取指定大小字体
#define kfont(size) [UIFont systemFontOfSize:(size)]
//获取RGB颜色
#define kGetColorRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

//获取沙盒文档路径
#define kDocPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

//拼接文档路径
#define kAppendDocPath(filename) [kDocPath stringByAppendingPathComponent:filename]
#endif
