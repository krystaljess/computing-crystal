//
//  DyuLoginRegisterViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/20.
//  Copyright © 2016年 dyuk. All rights reserved.
//
#define ScreenW [UIScreen mainScreen].bounds.size.width
#import "DyuLoginRegisterViewController.h"
#import "DyuLoginRegisterView.h"
#import "DyuFastLoginView.h"
#import "UIView+Frame.h"
@interface DyuLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCons;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end
/*
 如何搭建复杂界面
 1.划分结构(3层)
 2.一个结构一个结构去搭建
 */

/*
 xib使用注意点:
 1.控件从xib加载,必须再次设置frame,确定下位置和尺寸
 2.在viewDidLayoutSubviews里面设置控制器view的子控件的位置
 */
@implementation DyuLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    DyuLoginRegisterView *loginView = [DyuLoginRegisterView loginView];
    [_middleView addSubview:loginView];
    
    DyuLoginRegisterView *registerView = [DyuLoginRegisterView registerView];
    [_middleView addSubview:registerView];
    
    DyuFastLoginView *fastlogin = [DyuFastLoginView fastlogin];
    [_bottomView addSubview:fastlogin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)dimss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)ClickRegister:(UIButton *)sender {
    sender.selected = !sender.selected;
    // 注意点:不能修改frame,因为这个控件有约束
    // 平移中间view
    _leftCons.constant = _leftCons.constant == 0?-ScreenW:0;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
  
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    UIView *loginView = [_middleView.subviews firstObject];
    loginView.frame = CGRectMake(0, 0,_middleView.width * 0.5, _middleView.height);
    
    UIView *registerView = [_middleView.subviews lastObject];
    registerView.frame = CGRectMake(_middleView.width * 0.5, 0, _middleView.width * 0.5, _middleView.height);
    
}

@end
