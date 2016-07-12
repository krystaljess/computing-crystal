//
//  DyuADViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/18.
//  Copyright © 2016年 dyuk. All rights reserved.
//
#define DyuCode @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#import "DyuADViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "DyuADItem.h"
#import <MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>
#import "DyuViewController.h"

// bug:
// assets发现有unassign,说明这个图片不会打包到主bundle,也就不能使用
// 直接往自己工程中导入

// 占位思想(搞一个view站着一个位置,然后需要添加子控件的时候,直接往占位视图添加)
// 1.当一个界面,层次比较深,用占位视图思想比较轻松搭建好界面,不会去把其它层次给挡住

// cocoapods好处: 2014
// cocoapods:自动帮你管理第三方框架,导入一个框架,会自动把这个框架的依赖的框架给导入进去
/*
 cocoapods使用步骤:
 1.使用命令行 cd进入到工程文件的文件夹中
 2.pod init 创建podfile文件
 3.pod search 搜索需要导入框架描述
 4.pod install
 5.关闭当前工程,使用workspace打开项目
 */

// cocoapods加载第三方框架
// cocoapods:必须要有podfile,注意点podfile必须要跟项目工程文件在同一级目录下
// podfile:描述需要加载的第三方框架

// 1.cocoapods插件 2.使用命令行
// cocoapods注意点:podfile必须要描述当前是哪个工程
@interface DyuADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *AdImage;
@property (weak, nonatomic) IBOutlet UIButton *BtnButten;

@property (weak, nonatomic) IBOutlet UIView *DyuView;

@property(nonatomic , strong)DyuADItem *Item;

//定时器
@property(nonatomic , weak)NSTimer *time;
@end

@implementation DyuADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.AdImage.image = [UIImage imageNamed:@"LaunchImage-700-568h@2x"];
    // Do any additional setup after loading the view from its nib.
    [self loadADData];
    
    
    _time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerChne) userInfo:nil repeats:YES];
}
static int i= 3;
-(void)timerChne
{
    
    i--;
    
    [_BtnButten setTitle:[NSString stringWithFormat:@"跳过(%d)",i] forState:UIControlStateNormal];
    if(i == -1){
        [self BtnClick:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadADData
{
    //AFN
    //1.创建会话请求者对象
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    //2.拼接请求参数
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"code2"] = DyuCode;
    
    //3.发送请求
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        //请求成功 调用数据
        NSDictionary *dict = [responseObject[@"ad"] firstObject];
        DyuADItem *item = [DyuADItem mj_objectWithKeyValues:dict];
        _Item = item;
   
        //创建图片
        UIImageView *imageView = [[UIImageView alloc] init];
        //可以触发点击事件
        imageView.userInteractionEnabled = YES;
     
        //设置imageView的位置大小
        CGFloat height = item.h / ScreenH * item.w;
        if(height > ScreenH * 0.8){
            height = ScreenH * 0.8;
        }
        
        imageView.frame = CGRectMake(0, 0, ScreenW, height);
        [imageView sd_setImageWithURL:[NSURL URLWithString:item.w_picurl]];
     
        //添加图片点击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tap)];
        [imageView addGestureRecognizer:tap];
        
        [self.DyuView addSubview:imageView];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
     
    }];
    
}
- (IBAction)BtnClick:(UIButton *)sender {
    //设置控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = [[DyuViewController alloc] init];
    
    [_time invalidate];
}
-(void)Tap
{
    NSLog(@"打开网页");
    //打开网页
    NSURL *url = [NSURL URLWithString:_Item.ori_curl];
    
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
