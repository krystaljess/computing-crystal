//
//  EssenceViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/14.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "EssenceViewController.h"
#import "DyuTotaTableViewController.h"
#import "DyuVideoTableViewController.h"
#import "DyuVoiceTableViewController.h"
#import "DyuPictureTableViewController.h"
#import "DyuStoryTableViewController.h"
#import "UIBarButtonItem+Item.h"
#import "UIView+Frame.h"
#import "Dyu.pch"

@interface EssenceViewController ()

@end

@implementation EssenceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavItem];

    //添加子控制器
    [self setChildViewController];
}

-(void)setChildViewController
{
    DyuTotaTableViewController *tota = [[DyuTotaTableViewController alloc] init];
    [self addChildViewController:tota];
    tota.title = @"全部";
    
    DyuVideoTableViewController *video = [[DyuVideoTableViewController alloc] init];
    [self addChildViewController:video];
    video.title = @"视频";
    DyuVoiceTableViewController *voice = [[DyuVoiceTableViewController alloc] init];
    [self addChildViewController:voice];
    voice.title = @"声音";
    DyuPictureTableViewController *picture = [[DyuPictureTableViewController alloc] init];
    [self addChildViewController:picture];
    picture.title = @"图片";
    DyuStoryTableViewController *story = [[DyuStoryTableViewController alloc] init];
    [self addChildViewController:story];
    story.title = @"段子";
    
}
-(void)setNavItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed: @"nav_item_game_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(leftBtnClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] highImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(reghtBtnClick)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}
-(void)leftBtnClick
{
    NSLog(@"点击了精华left按钮");
}
-(void)reghtBtnClick
{
    NSLog(@"点击了精华reght按钮");
}


@end
