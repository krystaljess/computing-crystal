//
//  DyuWKViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/21.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuWKViewController.h"
#import <WebKit/WebKit.h>
@interface DyuWKViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *LiftBack;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *ReghtGo;
@property (weak, nonatomic) IBOutlet UIView *ContView;
@property (weak, nonatomic) IBOutlet UIProgressView *ProgerssView;


@property(strong , nonatomic)WKWebView *WkWeb;
@end

@implementation DyuWKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *WkWeb = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.ContView addSubview:WkWeb];
    _WkWeb = WkWeb;
    [self OpenUrl];
    //利用kvo进行监听
    
    [_WkWeb addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [_WkWeb addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [_WkWeb addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [_WkWeb addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)OpenUrl
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    
    [self.WkWeb loadRequest:request];
    
}
- (IBAction)GoBack:(UIBarButtonItem *)sender {
    [_WkWeb goBack];
}
- (IBAction)ComeReght:(UIBarButtonItem *)sender {
    [_WkWeb goForward];
}
- (IBAction)RefreshClick:(UIBarButtonItem *)sender {
    [_WkWeb reload];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
// 当监听对象发生改变时
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    _LiftBack.enabled = _WkWeb.canGoBack;
    _ReghtGo.enabled = _WkWeb.canGoForward;
    _ProgerssView.progress = _WkWeb.estimatedProgress;
    _ProgerssView.hidden = _WkWeb.estimatedProgress >= 1;
    
    self.title = _WkWeb.title;
}

//释放监听对象
-(void)dealloc
{
    [_WkWeb removeObserver:self forKeyPath:@"canGoBack"];
    [_WkWeb removeObserver:self forKeyPath:@"canGoForward"];
    [_WkWeb removeObserver:self forKeyPath:@"estimatedProgress"];
    [_WkWeb removeObserver:self forKeyPath:@"title"];
}
@end
