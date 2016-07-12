//
//  DyuNavViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/16.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuNavViewController.h"

@interface DyuNavViewController ()<UIGestureRecognizerDelegate>

@end

@implementation DyuNavViewController
/*
 滑动返回功能失效 => 把系统返回按钮覆盖
 系统滑动返回功能 是 用interactivePopGestureRecognizer去实现
 
 1.恢复滑动返回功能 => 为什么滑动返回功能失效 => 1.可能把interactivePopGestureRecognizer.enable = NO 2.也不可能把手势清空 3.代理做了事情
 
 
 // 假死状态:程序还在运行,但是界面死了,在根控制器的view下滑动返回
 
 // 让手势失效 1.直接把手势清空 2.设置手势enable 3.通过代理也可以让手势失效
 
 滑动返回功能在iOS7才有
 滑动返回功能底层实现原理: 1.给导航控制器的view添加pan手势 2.在每次push的时候,当之前界面截屏 3.当滑动返回的时候,把图片展示到上一层
 */


/*
 全屏滑动
 系统的滑动返回功能,只能在最左边的边缘才能触发
 触发这个interactivePopGestureRecognizer手势,就有滑动返回功能,触发target,action
 // <UIScreenEdgePanGestureRecognizer: 0x7fb8d0c32fa0; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fb8d0ea2cb0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fb8d0c327d0>)>>
 // action=handleNavigationTransition:
 // target=<_UINavigationInteractiveTransition 0x7fb8d0c327d0>)>>
 */
+ (void)load
{
    UINavigationBar *nav = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    
    NSMutableDictionary *dictarry = [NSMutableDictionary dictionary];
    dictarry[NSFontAttributeName] = [UIFont boldSystemFontOfSize:14];
    [nav setTitleTextAttributes:dictarry];
    
    [nav setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //保存滑动的代理
    id target = self.interactivePopGestureRecognizer.delegate;
    //创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    //控制触发手势
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    
    //限制系统边缘手势滑动
    self.interactivePopGestureRecognizer.enabled = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//类一加载进内存调用


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.childViewControllers.count > 0){
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn sizeToFit];
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        
    //隐藏所有底部tabar条;跳转;
    viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //当当前控制器为根控制器时返回no;
    return self.childViewControllers.count > 1;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)click:(UIButton *)btn
{
    [self popViewControllerAnimated:YES];
}
@end
