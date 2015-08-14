//
//  UserModel.h
//  SNSDemo
//
//  Created by LZXuan on 15-7-13.
//  Copyright (c) 2015年 轩哥. All rights reserved.
//

#import <Foundation/Foundation.h>
//数据模型
//专门 存放 数据
//存放 从网络上下载的数据 最终显示到 TableView的Cell上
//
@interface UserModel : NSObject
//用户id
@property (nonatomic,copy) NSString *uid;
//用户名
@property (nonatomic,copy) NSString *username;
//头像地址
@property (nonatomic,copy) NSString *headimage;

@end








