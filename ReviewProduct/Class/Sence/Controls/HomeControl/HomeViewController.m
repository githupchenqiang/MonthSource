//
//  HomeViewController.m
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/5.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import "HomeViewController.h"
#import "PageScrolelrViewController.h"

@interface HomeViewController ()<ZJScrollPageViewDelegate>
@property (nonatomic ,strong)NSArray<UIViewController *>            *ChildVC;
@property (nonatomic ,strong)PageScrolelrViewController             *pageControl;
@property (nonatomic ,strong)ZJScrollPageView                       *scrollPageView;
@property (nonatomic ,strong)NSArray                                *TitleArray;

@end

@implementation HomeViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"助手"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = image;
        UIImage *Seleimage = [UIImage imageNamed:@"助手Sele"];
        Seleimage = [Seleimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = Seleimage;
    }
    return self;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    self.TitleArray = @[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月"];
    
    [self setScrollerView];
    
  
    
}





- (void)setScrollerView{
    [_scrollPageView removeFromSuperview];
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 初始化
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    //显示滚动条
    style.showLine = YES;
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    _scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0,[PublicSource NavigationBarHeight], kScremWidth, kScremHeight-[PublicSource NavigationBarHeight]) segmentStyle:style titles:self.TitleArray parentViewController:self delegate:self];
    
    [self.view addSubview:self.scrollPageView];
    [_scrollPageView mas_makeConstraints:^(MASConstraintMaker *make) {
        Mas_Top(self.view, [PublicSource NavigationBarHeight]);
        Mas_left(self.view, 0);
        Mas_Right(self.view, 0);
        Mas_bottom(self.view,0);
    }];
    
    [_scrollPageView setSelectedIndex:0 animated:YES];
    
    
}
- (NSInteger)numberOfChildViewControllers
{
    return self.TitleArray.count;
}


- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    _pageControl = [[PageScrolelrViewController alloc] init];
    self.pageControl.Month = (int)index+1;
  
    return self.pageControl;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
