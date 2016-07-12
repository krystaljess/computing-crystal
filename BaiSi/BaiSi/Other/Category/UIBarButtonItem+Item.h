//
//  UIBarButtonItem+Item.h
//  BaiSi
//
//  Created by xiaomage on 16/6/16.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)
// 快速创建UIBarButtonItem
+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:( id)target action:(SEL)action;

// 快速创建UIBarButtonItem
+ (instancetype)itemWithImage:(UIImage *)image selectedImage:(UIImage *)highImage target:( id)target action:(SEL)action;
@end
