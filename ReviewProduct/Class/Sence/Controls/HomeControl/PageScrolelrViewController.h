//
//  PageScrolelrViewController.h
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/6.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJScrollPageView.h"
NS_ASSUME_NONNULL_BEGIN

@interface PageScrolelrViewController : UIViewController<ZJScrollPageViewChildVcDelegate>
@property (nonatomic ,assign)int         Month;
@end

NS_ASSUME_NONNULL_END
