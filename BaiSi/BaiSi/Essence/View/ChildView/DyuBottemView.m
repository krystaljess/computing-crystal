//
//  DyuBottemView.m
//  BaiSi
//
//  Created by xiaomage on 16/6/26.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuBottemView.h"
#import "DyuThemeItem.h"
@interface DyuBottemView ()
@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UIButton *cai;
@property (weak, nonatomic) IBOutlet UIButton *share;

@property (weak, nonatomic) IBOutlet UIButton *comments;


@end

@implementation DyuBottemView

-(void)setItem:(DyuThemeItem *)Item
{
    [_ding setTitle:Item.ding forState:UIControlStateNormal];
    [_cai setTitle:Item.cai forState:UIControlStateNormal];
    [_share setTitle:Item.repost forState:UIControlStateNormal];
    [_comments setTitle:Item.comment forState:UIControlStateNormal];
}

@end
