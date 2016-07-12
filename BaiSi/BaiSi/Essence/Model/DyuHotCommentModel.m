//
//  DyuHotCommentModel.m
//  BaiSi
//
//  Created by xiaomage on 16/6/27.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuHotCommentModel.h"
#import "DyuUserModel.h"
#import <MJExtension/MJExtension.h>
@implementation DyuHotCommentModel
- (NSString *)totalContent
{
    return [NSString stringWithFormat:@"%@:%@",self.user.username,self.content];
}
@end
