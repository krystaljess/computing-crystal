//
//  DyuHotCommentModel.h
//  BaiSi
//
//  Created by xiaomage on 16/6/27.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DyuUserModel.h"
@interface DyuHotCommentModel : NSObject
@property(nonatomic , strong)NSString *content;
@property(nonatomic , strong)DyuUserModel *user;

@property (nonatomic, strong) NSString *voicetime;

@property (nonatomic, strong) NSString *totalContent;
@end
