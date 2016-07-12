//
//  DyuThemeViewModel.h
//  BaiSi
//
//  Created by xiaomage on 16/6/25.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class DyuThemeItem;
@interface DyuThemeViewModel : NSObject
@property(nonatomic , strong)DyuThemeItem *item;

@property(nonatomic, assign) CGRect topViewFrame;
@property(nonatomic, assign) CGRect middleViewFrame;
@property(nonatomic, assign) CGRect hotViewFrame;
@property(nonatomic ,assign) CGRect bottemFrame;


@property(nonatomic, assign) CGFloat cellH;


@end
