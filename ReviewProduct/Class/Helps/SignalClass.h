//
//  SignalClass.h
//  MKHealthSchool
//
//  Created by QAING CHEN on 17/4/10.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
static AFHTTPSessionManager *manager;
@interface SignalClass : NSObject
@property (nonatomic ,strong)NSMutableArray         *markArray;
@property (nonatomic ,strong)NSIndexPath            *indexPath;
@property (nonatomic ,assign)BOOL                   isHistory; //标志是否从历史进入详情
+ (SignalClass *)ShreSignal;
+ (AFHTTPSessionManager *)shareSessionManager;


@end
