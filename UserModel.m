//
//  UserModel.m
//  SNSDemo
//
//  Created by LZXuan on 15-7-13.
//  Copyright (c) 2015年 轩哥. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
- (void)dealloc {
    //用户id
    self.uid = nil;//[_uid release]; _uid = nil;
    //用户名
    self.username = nil;
    //头像地址
    self.headimage = nil;
    [super dealloc];
}
@end








