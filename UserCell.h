//
//  UserCell.h
//  SNSDemo
//
//  Created by LZXuan on 15-7-13.
//  Copyright (c) 2015年 轩哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface UserCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *headImageView;
@property (retain, nonatomic) IBOutlet UILabel *uidLabel;
@property (retain, nonatomic) IBOutlet UILabel *usernameLabel;

//填充cell
- (void)showDataWithModel:(UserModel *)model;
@end










