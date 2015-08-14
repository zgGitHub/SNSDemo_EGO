//
//  UserCell.m
//  SNSDemo
//
//  Created by LZXuan on 15-7-13.
//  Copyright (c) 2015年 轩哥. All rights reserved.
//

#import "UserCell.h"
#import "UIImageView+WebCache.h"

@implementation UserCell
//xib初始化创建对象的时候调用
- (void)awakeFromNib {
    // Initialization code
    //允许layer 裁剪
    self.headImageView.layer.masksToBounds = YES;
    //圆角半径
    self.headImageView.layer.cornerRadius = 25;
}
- (void)showDataWithModel:(UserModel *)model {
    self.uidLabel.text = model.uid;
    self.usernameLabel.text = model.username;
    
#if 0
    //相对当前类 属于同步下载图片
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.headimage]];
    self.headImageView.image = [UIImage imageWithData:data];
#else
    //下载图片应该异步下载 否则 会导致界面卡死-->影响用户体验
    //SDWebImage 异步下载
    //第二个参数就是一个预加载图片 异步下载图片之前先显示0.png
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.headimage] placeholderImage:[UIImage imageNamed: @"0"]];
    
    
#endif
}
/*
 <6>SDWebImage异步显示图片
 (1)库导入中项目(拖进来即可)
 (2) ARC和非ARC混编
 如果是ARC项目,  SD库是非arc 那么需要设置非ARC编译,      -fno-objc-arc
 如果工程是非arc的， sd 库 是arc 的那么需要按照arc 编译  -fobjc-arc
 
 (3)导入头文件 #import "UIImageView+WebCache.h"
 (4)显示图片 [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:headImageUrl]];
 
	@"http://10.0.8.8/sns/" + imageUrl
 
 SDWebImage 是用arc写 的
 当前程序 默认是非arc 的代码  那么这时我们需要进行混合编译
 
 把SDWebImage的源码 在xcode 的build phase 选中 所有的SDWebImage的代码 文件 添加编译标记 -fobj-arc (表示 这些代码使用 arc 编译)
 

// SDWebImage下载图片是异步的 下载完成之后 会自动放在沙盒 中的Library/Cache/com.hackemist.SDWebImageCache.default 目录下作为缓存，下次再加载同一个 如果缓存有那么就直接从缓存获取，如果没有再异步下载

// SDWebImage自带缓存功能
//在沙盒的Libarary/Cache中创建文件夹ImageCache 所有的图片都会缓存在该文件夹下
// 先去磁盘中判断该图片是否存在 如果存在不下载 不存在下载
SDImageCache * cache = [SDImageCache sharedImageCache];
// 1.内存
[cache clearMemory];
// 1.磁盘
[cache clearDisk];


 */


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)dealloc {
    [_headImageView release];
    [_uidLabel release];
    [_usernameLabel release];
    [super dealloc];
}
@end
