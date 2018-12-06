//
//  DetailViewController.m
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/6.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView       *webView;
@property (nonatomic,strong)MBProgressHUD   *hud;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
//绘制webView
- (void)drawUI{
    
    _webView  = [[UIWebView alloc]initWithFrame:CGRectMake(10,0, kScremWidth -20, kScremHeight )];
    _webView.delegate = self;
    _webView .scalesPageToFit = YES;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:detailmainUrl(_ID)]];
    
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
