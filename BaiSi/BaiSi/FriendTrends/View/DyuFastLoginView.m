//
//  DyuFastLoginView.m
//  BaiSi
//
//  Created by xiaomage on 16/6/20.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuFastLoginView.h"

@implementation DyuFastLoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)fastlogin
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
@end
