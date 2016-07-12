//
//  UIBarButtonItem+Item.m
//  BaiSi
//
//  Created by xiaomage on 16/6/16.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)
// 快速创建UIBarButtonItem
+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:( id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    //在一个view上设置按钮
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}
+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)highImage target:( id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    //在一个view上设置按钮
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}
@end
