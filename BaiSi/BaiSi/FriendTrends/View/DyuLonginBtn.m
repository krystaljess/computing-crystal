//
//  DyuLonginBtn.m
//  BaiSi
//
//  Created by xiaomage on 16/6/20.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuLonginBtn.h"
#import "UIView+Frame.h"
@implementation DyuLonginBtn

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    
    
    
    [self.titleLabel sizeToFit];
    
    self.titleLabel.centerX = self.width * 0.5;
    self.titleLabel.y = self.height - self.titleLabel.height;
}

@end
