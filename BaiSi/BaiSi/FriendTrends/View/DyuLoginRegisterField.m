//
//  DyuLoginRegisterField.m
//  BaiSi
//
//  Created by xiaomage on 16/6/21.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuLoginRegisterField.h"
#import "UITextField+Placeholder.h"

@implementation DyuLoginRegisterField

- (void)awakeFromNib
{
    //光标
    self.tintColor = [UIColor blackColor];
    
    //文本框颜色
    self.textColor = [UIColor blueColor];
    
    //监听点击
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];
    
}



#pragma mark - 文本框开始编辑就会调用
- (void)textBegin
{
    // 设置文本框占位文字颜色
    self.placeholderColor = [UIColor whiteColor];
    
}
- (void)textEnd
{
    self.placeholderColor = [UIColor lightGrayColor];
    
}
@end
