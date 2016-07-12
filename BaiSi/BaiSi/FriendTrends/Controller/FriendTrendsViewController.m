//
//  FriendTrendsViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/20.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "FriendTrendsViewController.h"
#import "UIBarButtonItem+Item.h"
#import "DyuLoginRegisterViewController.h"
#import "DyuTwoTableViewController.h"
@interface FriendTrendsViewController ()

@end

@implementation FriendTrendsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setNavItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] highImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(leftItemClick)];
    self.navigationItem.title = @"关注";
}
- (IBAction)ClickPushController:(UIButton *)sender {
    DyuLoginRegisterViewController *al = [[DyuLoginRegisterViewController alloc ] init];
    [self presentViewController:al animated:YES completion:nil];
}
-(void)leftItemClick
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"DyuTwoTableViewController" bundle:nil];
    DyuTwoTableViewController *Two = [story instantiateInitialViewController];;
    [self.navigationController pushViewController:Two animated:YES];
}

@end
