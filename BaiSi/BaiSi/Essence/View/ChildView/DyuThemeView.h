//
//  DyuThemeView.h
//  BaiSi
//
//  Created by xiaomage on 16/6/26.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DyuThemeView.h"
@class DyuThemeItem;
@interface DyuThemeView : UIView
@property(nonatomic , strong)DyuThemeItem *Item;
+ (instancetype)viewForXib;
@end
