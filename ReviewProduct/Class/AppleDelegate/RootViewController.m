//
//  RootViewController.m
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/5.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "OtherViewController.h"
#import "UserViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加视图控制器
    [self p_setupControllers];
}

- (void)p_setupControllers
{
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSFontAttributeName : [UIColor colorWithRed:244/255.0 green:234/255.0 blue:42/255.0 alpha:1],NSFontAttributeName:[UIFont fontWithName:@"Marion-Italic" size:14.0]}            forState:UIControlStateSelected];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.backgroundColor = [UIColor colorWithRed:125/255.0 green:197/255.0 blue:235/255.0 alpha:1.000];
    //四个模块：首页、常见病症、医药资讯、我
    
    UINavigationController * homeNC = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    homeNC.tabBarItem.title = @"孕期美食";
    homeNC.navigationBar.barTintColor = [UIColor colorWithRed:125/255.0 green:197/255.0 blue:235/255.0 alpha:1.000];
    
    
    UINavigationController *common = [[UINavigationController alloc]initWithRootViewController:[OtherViewController new]];
    common.tabBarItem.title = @"育儿美食";
    common.navigationBar.barTintColor = [UIColor colorWithRed:125/255.0 green:197/255.0 blue:235/255.0 alpha:1.000];
    
    UINavigationController *suffer = [[UINavigationController alloc]initWithRootViewController:[UserViewController new]];
    suffer.tabBarItem.title = @"我的";
    suffer.navigationBar.barTintColor = [UIColor colorWithRed:125/255.0 green:197/255.0 blue:235/255.0 alpha:1.000];
    
//    UINavigationController *User = [[UINavigationController alloc]initWithRootViewController:[UserListController new]];
//    User.tabBarItem.title = @"用户";
//    User.navigationBar.barTintColor = [UIColor colorWithRed:125/255.0 green:197/255.0 blue:235/255.0 alpha:1.000];
    self.viewControllers = @[homeNC,common,suffer];
    
    
}


@end
