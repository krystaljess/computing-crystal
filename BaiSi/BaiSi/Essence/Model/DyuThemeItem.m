//
//  DyuThemeItem.m
//  BaiSi
//
//  Created by xiaomage on 16/6/25.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuThemeItem.h"
#import "DyuHotCommentModel.h"
#import <MJExtension/MJExtension.h>
@implementation DyuThemeItem

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"top_cmt": [DyuHotCommentModel class]};
}
- (void)setTop_cmt:(NSArray *)top_cmt
{
    _top_cmt = top_cmt;
    
    if (_top_cmt.count) {
        // 取出模型给它赋值
        _HotComment = top_cmt.firstObject;
        
    }
}

@end
