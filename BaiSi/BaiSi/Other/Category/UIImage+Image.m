//
//  UIImage+Image.m
//  BaiSi
//
//  Created by xiaomage on 16/6/16.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
// 返回一个没有被渲染的图片
+ (UIImage *)imageOriginalWithImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
- (UIImage *)setCircularPicture
{
    UIGraphicsBeginImageContext(self.size);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [path addClip];
    
    [self drawAtPoint:CGPointZero];
    
    UIImage *imager = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imager;
}
@end
