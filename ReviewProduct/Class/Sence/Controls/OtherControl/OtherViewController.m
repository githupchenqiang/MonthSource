//
//  OtherViewController.m
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/5.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView       *webView;
@property (nonatomic,strong)MBProgressHUD   *hud;

@end

@implementation OtherViewController
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
    [self drawUI];
}
//绘制webView
- (void)drawUI{
    
    _webView  = [[UIWebView alloc]initWithFrame:CGRectMake(10,0, kScremWidth -20, kScremHeight )];
    _webView.delegate = self;
    _webView .scalesPageToFit = YES;
    _webView.scrollView.bounces = NO;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:OtherUrl]];
    
    [_webView loadRequest:request];
    _webView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_webView];
    self.view.backgroundColor = [UIColor whiteColor];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        self.hud.activityIndicatorColor = [UIColor colorWithRed:246/255.0 green:8/255.0 blue:142/255.0 alpha:1];
        self.hud.mode = MBProgressHUDModeIndeterminate;
        self.hud.minSize = CGSizeMake(50, 50);
        self.hud.labelText = @"正在加载...";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.hud.labelText = @"网络超时";
            self.hud.hidden = YES;
        });
        [self.hud show:YES];
    });
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.hud.hidden = YES;
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
