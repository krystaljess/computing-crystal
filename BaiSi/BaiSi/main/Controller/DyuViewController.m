//
//  DyuViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/14.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuViewController.h"
#import "EssenceViewController.h"
#import "FriendTrendsViewController.h"
#import "MeTableViewController.h"
#import "NewViewController.h"
#import "PublishViewController.h"
#import "DyuNavViewController.h"
@interface DyuViewController ()
-(void)setUpController:(UIViewController *)controller titletext:(NSString *)title image:(UIImage *)image selected:(UIImage *)selectedimage;
@end

@implementation DyuViewController
// 类一加载进内存就会调用
+(void)load
{ // 获取全局UITabBarItem外观
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    // 设置标题颜色
    // ***模型一般都是通过富文本属性去设置文字的颜色,字体等等.***
    // 通过富文本属性 去设置 文字颜色,字体
    // 设置选中状态
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
    // 设置正常状态下
    // ****设置tabBar上按钮文字字体,必须通过正常状态下,才可以设置成功****
    NSMutableDictionary *arry = [NSMutableDictionary dictionary];
    arry[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:arry forState:UIControlStateNormal];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupCenterButton];
}

-(void)setUp
{
    //精华
    EssenceViewController *vc = [[EssenceViewController alloc] init];
    [self setUpController:vc titletext:@"精华" image: [UIImage imageNamed:@"tabBar_essence_icon"]selected:[UIImage imageNamed:@"tabBar_essence_click_icon"]];
    
    //新帖
    NewViewController *vc1 = [[NewViewController alloc] init];
    [self setUpController:vc1 titletext:@"新帖" image: [UIImage imageNamed:@"tabBar_friendTrends_icon"]selected:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"]];
    
    //
    UIViewController *vc2 = [[UIViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    [self addChildViewController:nav2];
    vc2.tabBarItem.enabled = YES;
    
    //关注
    FriendTrendsViewController *vc3 = [[FriendTrendsViewController alloc] init];
    [self setUpController:vc3 titletext:@"关注" image: [UIImage imageNamed:@"tabBar_new_icon"]selected:[UIImage imageNamed:@"tabBar_new_click_icon"]];
    
    //我的
    UIStoryboard *stoy = [UIStoryboard storyboardWithName:@"MeTableViewController" bundle:nil];
    MeTableViewController *vc4 = [stoy instantiateInitialViewController];
    [self setUpController:vc4 titletext:@"我" image: [UIImage imageNamed:@"tabBar_me_icon"]selected:[UIImage imageNamed:@"tabBar_me_click_icon"]];
}
-(void)setupCenterButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
    
    [btn sizeToFit];
    btn.center = CGPointMake(self.tabBar.frame.size.width * 0.5, self.tabBar.frame.size.height * 0.5);
    [self.tabBar addSubview:btn];
    [btn addTarget:self action:@selector(pushpiblishController) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pushpiblishController
{
    NSLog(@"asdf");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)setUpController:(UIViewController *)controller titletext:(NSString *)title image:(UIImage *)image selected:(UIImage *)selectedimage
{
    DyuNavViewController *nav = [[DyuNavViewController alloc] initWithRootViewController:controller];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectedimage = [selectedimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = image;
    controller.tabBarItem.selectedImage = selectedimage;
    
    [self addChildViewController:nav];
    
}
@end
