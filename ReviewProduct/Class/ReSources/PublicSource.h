//
//  PublicSource.h
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/5.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface PublicSource : NSObject
+ (BOOL)IS_iPhoneX;
+ (CGFloat)NavigationBarHeight;
+ (CGFloat)TabbarHeight;
+ (CGFloat)statusBarHeight;

/**
 多事件提示框

 @param viewController self
 @param title 标题
 @param message 消息
 @param CancleTitle 取消
 @param DownTitle 确定
 @param cancleButton 取消事件
 @param DownButton 确定事件
 */
+ (void)showTipAlertViewWith:(UIViewController *)viewController
                       title:(NSString *)title
                     message:(NSString *)message
                 CancleTitle:(NSString *)CancleTitle
                   downTitle:(NSString *)DownTitle
                CancelButton:(void (^)(void))cancleButton
                  DownButton:(void (^)(void))DownButton;


/**
 单事件提示框

 @param viewController self
 @param title 标题
 @param message 消息
 @param DownTitle 确定
 @param DownButton 确定事件
 */
+ (void)showDowntViewWith:(UIViewController *)viewController
                    title:(NSString *)title
                  message:(NSString *)message
                downTitle:(NSString *)DownTitle
               DownButton:(void (^)(void))DownButton;

/**
 设置显示时间的提示框
 
 @param viewController control
 @param title 提示
 @param message 内容
 @param DalyTime 时间 s
 */
+(void)showTipAlertViewWith:(UIViewController *)viewController
                      title:(NSString *)title
                    message:(NSString *)message
                   DalyTime:(CGFloat)DalyTime;


/**
 获取设备UUID

 @return UUID 小写
 */
+(NSString *)DeviceUUID;


/**
 MBPHUD带时间提示框

 @param delay 时间(S)
 @param string 消息
 */
+ (void)showAlertWithdelay:(CGFloat)delay string:(NSString *)string;



/**
 分享接口
 
 @param url 分享Url
 @param ImageURl ImageUrl
 @param title 标题
 @param des 描述
 */
+ (void)shareControlWithUrl:(NSString *)url ImageUrl:(NSString *)ImageURl title:(NSString *)title des:(NSString *)des ViewControl:(UIViewController *)control;
@end
