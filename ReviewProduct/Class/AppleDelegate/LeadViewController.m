//
//  LeadViewController.m
//  HealthAdministration
//
//  Created by AmpleSky on 2018/12/3.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import "LeadViewController.h"
#import "RootViewController.h"
@interface LeadViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView        *scroller;
@property (nonatomic,strong) UIPageControl      *aPateControl;
@end

@implementation LeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScremWidth, kScremHeight)];
    _scroller.pagingEnabled = YES;
    _scroller.contentSize = CGSizeMake(kScremWidth * 3, kScremHeight);
    _scroller.showsHorizontalScrollIndicator = NO;
    _scroller.bounces = NO;
    _scroller.delegate = self;
    [self.view addSubview:_scroller];
 
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScremWidth * i,0,kScremWidth, kScremHeight)];
        imageView.userInteractionEnabled = YES;
        imageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%dScro",i+1]];
        UIButton * abutton = [UIButton  buttonWithType:UIButtonTypeRoundedRect];
        abutton.frame = CGRectMake(kScremWidth-215,kScremHeight -150,100,40);
        abutton.center = CGPointMake(kScremWidth/2, kScremHeight-150);
        [abutton setTitle:@"立即体验" forState:UIControlStateNormal];
        [abutton setTintColor:[UIColor blackColor]];
        [abutton setBackgroundColor:[UIColor clearColor]];
        abutton.layer.cornerRadius = 10;
        abutton.layer.masksToBounds=YES;
        abutton.layer.borderWidth = 2;
        CGColorSpaceRef colorSpace =CGColorSpaceCreateDeviceRGB();
        // 新建一个红色的ColorRef，用于设置边框（四个数字分别是 r, g, b, alpha
        CGColorRef borderColorRef = CGColorCreate(colorSpace,(CGFloat[]){ 0.7, 0.7, 0.7, 1 });
        // 设置边框颜色
        abutton.layer.borderColor = borderColorRef;
        [abutton addTarget:self action:@selector(abuttonTouch:) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:abutton];
        [imageView  bringSubviewToFront:abutton];
        [self.scroller addSubview:imageView];
    }
       [self aPateControl];
    
    
}
-(void)abuttonTouch:(UIButton *)abutton{
  
    self.view.window.rootViewController = [[RootViewController alloc]init];;
}


-(UIPageControl *)aPateControl{
    if (_aPateControl ==nil) {
        _aPateControl =
        _aPateControl = [[UIPageControl alloc] initWithFrame:CGRectMake(35, kScremHeight -40, 300, 20)];
        _aPateControl.center =CGPointMake(kScremWidth/2, kScremHeight-40);
        //设置表示的页数
        _aPateControl.numberOfPages =3;
        //设置选中的页数
        _aPateControl.currentPage =0;
        //设置未选中点的颜色
        _aPateControl.pageIndicatorTintColor = [UIColor grayColor];
        //设置选中点的颜色
        _aPateControl.currentPageIndicatorTintColor =[UIColor blackColor];
        //添加响应事件
        [_aPateControl addTarget:self action:@selector(handlePageControl:)forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_aPateControl];
    }
    return _aPateControl;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.aPateControl.currentPage = scrollView.contentOffset.x /kScremWidth;
}

- (void)handlePageControl:(UIPageControl *)pageControl
{
    //切换pageControl .对应切换scrollView不同的界面
    [self.scroller setContentOffset:CGPointMake(kScremWidth * pageControl.currentPage,0)animated:YES];
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
