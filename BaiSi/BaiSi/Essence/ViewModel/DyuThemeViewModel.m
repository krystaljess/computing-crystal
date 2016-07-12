//
//  DyuThemeViewModel.m
//  BaiSi
//
//  Created by xiaomage on 16/6/25.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuThemeViewModel.h"
#import "DyuThemeItem.h"
#import "DyuUserModel.h"
#import "DyuHotCommentModel.h"
#import "UIView+Frame.h"
#import "Dyu.pch"
@implementation DyuThemeViewModel
-(void)setItem:(DyuThemeItem *)item
{
    _item = item;
    //顶部view
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat mager = 10;
    CGFloat originY = 65;
    //计算文字高度
//    NSString *str = [NSString stringWithFormat:@"%@%@",item.text,item.name];
    CGFloat textH = [item.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(ScreenW - 20, MAXFLOAT)].height;
    CGFloat h = textH + originY + mager;
    CGFloat w = ScreenW;
    _topViewFrame = CGRectMake(x, y, w, h);
    
    //图片/视频/声音位置
    CGFloat Px = mager;
    CGFloat Py = CGRectGetMaxY(_topViewFrame);
    CGFloat Pw = ScreenW - mager * 2;
    CGFloat Ph = Pw / item.width * item.height;
    
    if(item.height >= ScreenH){
        Ph =300;
        item.is_big = YES;
    }
    
    _middleViewFrame = CGRectMake(Px, Py, Pw, Ph);
    

    CGFloat commentX = mager;
    CGFloat commentY = 0;
    if (item.HotComment) {
        if(item.type == DyuThemeTypeText){
            commentY = Py;
        }else{
            commentY = Ph + Py;
        }
        CGFloat commentW = ScreenW - 20;
        CGFloat originY = 20;
        CGFloat commentH =  originY + 21;
        CGFloat textH = 0;
        if(item.HotComment.content.length){
            textH = [item.HotComment.totalContent sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(w, MAXFLOAT)].height;
            commentH = originY + textH;
        }
        _hotViewFrame = CGRectMake(commentX, commentY, commentW, commentH);
    }
    //bottem位置
    CGFloat Bx = 0;
    CGFloat By = 0;
    if(item.type == DyuThemeTypeText){
        By = Py;
    }else{
        By = Ph + Py;
    }
    
    CGFloat Bw = ScreenW;
    CGFloat Bh = 30;
    if(item.HotComment){
        By = Bh + commentY + 10;
    }
    _bottemFrame = CGRectMake(Bx, By, Bw, Bh);
    _cellH = CGRectGetMaxY(_bottemFrame) + 10;
    
}
@end
