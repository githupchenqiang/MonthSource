//
//  UserViewController.m
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/5.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController
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
    // Do any additional setup after loading the view.
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
