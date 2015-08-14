//
//  LZXHttpRequest.m
//  SNSDemo
//
//  Created by LZXuan on 15-7-13.
//  Copyright (c) 2015年 轩哥. All rights reserved.
//

#import "LZXHttpRequest.h"

@implementation LZXHttpRequest
- (void)dealloc {
    self.myFailedBlock = nil;
    self.mySuccessBlock = nil;
    
    [_httpRequest release];
    self.downloadData = nil;
    [super dealloc];
}
- (instancetype)init {
    if (self = [super init]) {
        //初始化 数据对象
        self.downloadData = [[[NSMutableData alloc] init] autorelease];
    }
    return self;
}
- (void)downloadDataWithUrl:(NSString *)urlStr success:(DownloadSuccessBlock)successBlock failed:(DownloadFailedBlock)failedBlock{
    if (_httpRequest) {
        [_httpRequest release];
        _httpRequest = nil;
    }
    //保存block 否则 block 就会随时释放
    self.mySuccessBlock = successBlock;
    self.myFailedBlock = failedBlock;
    
    
    //创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: urlStr]];
    //创建 下载连接
    _httpRequest = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    //一点创建 下载连接 就会启动一个线程去专门下载数据
}
#pragma mark - NSURLConnectionDataDelegate
//客户端 接收到 服务器的响应
//服务器将要 发送数据
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    //清空旧数据
    [self.downloadData setLength:0];
}
//接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.downloadData appendData:data];
}
//下载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //下载完成 之后 要回调block 解析数据
    if (self.mySuccessBlock) {
        //调用block 把下载数据传入
        self.mySuccessBlock(self.downloadData);
    }
}
//下载失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if (self.myFailedBlock) {
        //回调
        self.myFailedBlock(error);
    }
}

@end










