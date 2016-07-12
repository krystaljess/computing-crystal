//
//  UIImage+Image.h
//  BaiSi
//
//  Created by xiaomage on 16/6/16.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
// 返回一个没有被渲染的图片
+ (UIImage *)imageOriginalWithImageName:(NSString *)imageName;
- (UIImage *)setCircularPicture;
@end
