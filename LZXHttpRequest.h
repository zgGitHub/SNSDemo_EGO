//
//  LZXHttpRequest.h
//  SNSDemo
//
//  Created by LZXuan on 15-7-13.
//  Copyright (c) 2015年 轩哥. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 我们 网络app  一般有多个界面 要进行下载数据，下载数据的代码都是一样的，这时我们可以把专门下载数据的代码 封装到一个类中，专门进行下载数据，如果界面需要下载数据那么就直接通过下载类进行就可以了
 */
//当前类只管下载数据，但是不知道如何处理数据
//这时我们采用代理设计模式 进行委托其他界面进行处理数据

//1.用协议规范代理的行为（代理模式）
//2.block 回调 (代理模式)

//block回调
//用 typedef 重新定义 block 类型 DownloadSuccessBlock
typedef void (^DownloadSuccessBlock)(NSMutableData *download);

typedef void (^DownloadFailedBlock)(NSError *error);


@interface LZXHttpRequest : NSObject <NSURLConnectionDataDelegate>
{
    //请求下载连接
    NSURLConnection *_httpRequest;
    NSMutableData *_downloadData;
}
/*
 1.定义block类型  ---》主动方
 2.在哪里调用block ---》主动方/委托方调用 block
 3.在哪传block--》在 被动方写block 传给主动方
 */


@property (nonatomic,strong) NSMutableData *downloadData;
//保存 两个block  block 只能拷贝
@property (nonatomic,copy) DownloadSuccessBlock mySuccessBlock;
@property (nonatomic,copy) DownloadFailedBlock myFailedBlock;

//下载数据方法  下载之前把block 传入
- (void)downloadDataWithUrl:(NSString *)urlStr
                    success:(DownloadSuccessBlock)successBlock
                     failed:(DownloadFailedBlock)failedBlock;
@end











