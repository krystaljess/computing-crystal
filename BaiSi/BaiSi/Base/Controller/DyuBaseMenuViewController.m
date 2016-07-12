//
//  DyuBaseMenuViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/23.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuBaseMenuViewController.h"
#import "UIBarButtonItem+Item.h"
#import "UIView+Frame.h"
#import "Dyu.pch"

static NSString *ID = @"cell";
@interface DyuBaseMenuViewController ()<UICollectionViewDelegate , UICollectionViewDataSource>
@property(nonatomic , weak)UIScrollView *titleView;
@property(nonatomic , weak)UIButton *btn;
@property(nonatomic , weak)UICollectionView *collection;
@property(nonatomic , strong)NSMutableArray *buttenArray;
@property(nonatomic , strong)UIView *lineView;
@property(nonatomic , assign)BOOL isInitial;
@end

@implementation DyuBaseMenuViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置底部collectionview
    [self setCollectionView];

    //头部标签
    [self setTitleView];

    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)buttenArray
{
    if(_buttenArray == nil){
        _buttenArray = [NSMutableArray array];
    }
    return _buttenArray;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if(_isInitial == NO){
        [self setTitleBtn];
        _isInitial = YES;
    }
}
-(void)setTitleBtn
{
    NSInteger count = self.childViewControllers.count;
    for(int i = 0;i < count; i++)
    {
        //设定按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        UIViewController *vl = self.childViewControllers[i];
        [btn setTitle:vl.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        CGFloat btnw = ScreenW / count;
        CGFloat btnx = i * btnw;
        btn.frame = CGRectMake(btnx,0, btnw, _titleView.height);
        [_titleView addSubview:btn];
        [self.buttenArray addObject:btn];
        [btn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if(i == 0){
            UIView *lineView = [[UIView alloc] init];
            [_titleView addSubview:lineView];
            [btn.titleLabel sizeToFit];
            lineView.backgroundColor = [UIColor grayColor];
            _lineView = lineView;
            lineView.width = btn.titleLabel.width;
            lineView.height = 3;
            lineView.y = _titleView.height - lineView.height;
            lineView.centerX = btn.centerX;
        }
    }
    
    
}
-(void)setCollectionView
{
    //设置布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //创建collection
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    collection.pagingEnabled = YES;
    collection.delegate = self;
    collection.dataSource = self;
    collection.showsHorizontalScrollIndicator = NO;
    collection.backgroundColor = [UIColor colorWithRed:234 green:199 blue:141 alpha:0.8];
    [self.view addSubview:collection];
    _collection = collection;
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
}
-(void)setTitleView
{
    CGFloat x = 0;
    CGFloat y = 64;
    CGFloat w = ScreenW;
    CGFloat h = 35;
    UIScrollView *titleView = [[UIScrollView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    titleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    _titleView = titleView;
}
-(void)titleBtnClick:(UIButton *)btn
{
    [self BtnSelected:btn];
    NSInteger i = btn.tag;
    _collection.contentOffset = CGPointMake(i * ScreenW, 0);
    
}
#pragma make -- collectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.childViewControllers.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIViewController *vc = self.childViewControllers[indexPath.row];
    vc.view.frame = [UIScreen mainScreen].bounds;
    [cell.contentView addSubview:vc.view];
    return cell;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = _collection.contentOffset.x / ScreenW;
    UIButton *btn = self.buttenArray[page];
    [self BtnSelected:btn];
}
-(void)BtnSelected:(UIButton *)btn
{
    _btn.selected = NO;
    btn.selected = YES;
    _btn = btn;
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.centerX = btn.centerX;
    }];
}
@end
