//
//  PublicSource.m
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/5.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import "PublicSource.h"
#import <UIKit/UIKit.h>
#import <UShareUI/UShareUI.h>
@implementation PublicSource


+ (BOOL)IS_iPhoneX{
    
    return [UIScreen mainScreen].bounds.size.height >=  812 ? 1:0;
}
+ (CGFloat)NavigationBarHeight{
    return ([UIScreen mainScreen].bounds.size.height >=  812 ? 1:0) == 1 ? 88 : 64;
}
+ (CGFloat)TabbarHeight{
    return  ([UIScreen mainScreen].bounds.size.height >=  812 ? 1:0) == 1 ? (49 + 34) : 49;
}
+ (CGFloat)statusBarHeight{
    return  ([UIScreen mainScreen].bounds.size.height >=  812 ? 1:0) == 1 ? 44 : 20;
    
}

#define NavigationBarHeight = IS_iPhoneX
#define TabbarHeight = (IS_iPhoneX == 1 ? (49 + 34) : 49)
#define statusBarHeight = (IS_iPhoneX == 1 ? 44 : 20)

+ (void)showTipAlertViewWith:(UIViewController *)viewController
                       title:(NSString *)title
                     message:(NSString *)message
                 CancleTitle:(NSString *)CancleTitle
                   downTitle:(NSString *)DownTitle
                CancelButton:(void (^)(void))cancleButton
                  DownButton:(void (^)(void))DownButton
{
    UIAlertController *Contr = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:CancleTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancleButton();
    }];
    
    UIAlertAction *Down = [UIAlertAction actionWithTitle:DownTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        DownButton();
    }];
    
    [Contr addAction:action];
    [Contr addAction:Down];
    [viewController presentViewController:Contr animated:YES completion:nil];
}

+ (void)showDowntViewWith:(UIViewController *)viewController
                    title:(NSString *)title
                  message:(NSString *)message
                downTitle:(NSString *)DownTitle
               DownButton:(void (^)(void))DownButton{
    
    UIAlertController *Contr = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *Down = [UIAlertAction actionWithTitle:DownTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        DownButton();
    }];
    [Contr addAction:Down];
    [viewController presentViewController:Contr animated:YES completion:nil];
}

+ (void)showAlertWithdelay:(CGFloat)delay string:(NSString *)string
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = string;
    hud.margin = 50.0f; //提示框的大小
    [hud customView];
    hud.removeFromSuperViewOnHide = YES; //隐藏之后删除view
    [hud hide:YES afterDelay:delay];
}


+(NSString *)DeviceUUID{
    
    NSString *currentDeviceUUIDStr;
    NSUUID * currentDeviceUUID  = [UIDevice currentDevice].identifierForVendor;
    currentDeviceUUIDStr = currentDeviceUUID.UUIDString;
    currentDeviceUUIDStr = [currentDeviceUUIDStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
    currentDeviceUUIDStr = [currentDeviceUUIDStr lowercaseString];
    return currentDeviceUUIDStr;
}

+ (void)shareControlWithUrl:(NSString *)url ImageUrl:(NSString *)ImageURl title:(NSString *)title des:(NSString *)des ViewControl:(UIViewController *)control
{
    __weak typeof (self)weakSelf = self;
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_Qzone),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        if (platformType == UMSocialPlatformType_QQ) {
            [weakSelf shareTextToPlatformType:UMSocialPlatformType_QQ ShareUrl:url ImageUrl:ImageURl title:title des:des viewControl:control];
        }else if (platformType == UMSocialPlatformType_WechatSession)
        {
            [weakSelf shareTextToPlatformType:UMSocialPlatformType_WechatSession ShareUrl:url ImageUrl:ImageURl title:title des:des viewControl:control];
        }else if (platformType == UMSocialPlatformType_WechatTimeLine)
        {
            [weakSelf shareTextToPlatformType:UMSocialPlatformType_WechatSession ShareUrl:url ImageUrl:ImageURl title:title des:des viewControl:control];
        }else if (platformType == UMSocialPlatformType_Qzone)
        {
            [weakSelf shareTextToPlatformType:UMSocialPlatformType_Qzone ShareUrl:url ImageUrl:ImageURl title:title des:des viewControl:control];
        }
    }];
}
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType ShareUrl:(NSString *)url ImageUrl:(NSString *)ImageURl title:(NSString *)title des:(NSString *)des viewControl:(UIViewController *)control
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象
    NSURL *imageUrl = [NSURL URLWithString:ImageURl];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:des thumImage:image];
    //    设置网页地址
    shareObject.webpageUrl = url;
    //    分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口 t
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:control completion:^(id data, NSError *error) {
        if (error) {
        }else{
            
        }
    }];
}
@end
