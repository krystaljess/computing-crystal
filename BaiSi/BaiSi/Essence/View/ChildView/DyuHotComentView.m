//
//  DyuHotComentView.m
//  BaiSi
//
//  Created by xiaomage on 16/6/26.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuHotComentView.h"
#import "DyuThemeItem.h"
#import "DyuHotComentView.h"
#import "DyuUserModel.h"
#import "DyuHotCommentModel.h"
@interface DyuHotComentView ()
@property (weak, nonatomic) IBOutlet UILabel *lable;


@end
@implementation DyuHotComentView
- (void)awakeFromNib
{
    // autoresizing 自动拉伸属性 iOS6之前经常会使用
    // 任何控件默认都会有的
    // 有自动布局 就不需要自动拉伸属性
    // 如果一个控件从xib加载出来,莫名其妙的问题,就是自动拉伸属性导致
    self.autoresizingMask = UIViewAutoresizingNone;
}
- (void)setItem:(DyuThemeItem *)item
{
    if (item.HotComment.content.length) {
        _lable.text = item.HotComment.totalContent;
        
    } else {
//        _nameView.text = [NSString stringWithFormat:@"%@ : ", item.HotComment.user.username];
//        
//        [_voiceView setTitle:item.topComment.voicetime forState:UIControlStateNormal];
//        
    }
    
}
@end
