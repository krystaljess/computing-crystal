//
//  DyuLoginRegisterView.m
//  BaiSi
//
//  Created by xiaomage on 16/6/20.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuLoginRegisterView.h"

@implementation DyuLoginRegisterView

+ (instancetype)loginView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}

+ (instancetype)registerView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
@end
