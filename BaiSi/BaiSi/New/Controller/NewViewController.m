//
//  NewViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/14.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "NewViewController.h"
#import "UIBarButtonItem+Item.h"
#import "DyuTotaTableViewController.h"
#import "DyuVideoTableViewController.h"
#import "DyuVoiceTableViewController.h"
#import "DyuPictureTableViewController.h"
#import "DyuStoryTableViewController.h"
#import "DyuLableTableViewController.h"
@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self setNavItem];
    
    //创建子控制器
    [self setChildViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(leftItemClick)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)leftItemClick
{
    DyuLableTableViewController *lable = [[DyuLableTableViewController alloc] init];

    [self.navigationController pushViewController:lable animated:YES];
}
@end
