//
//  SignalClass.m
//  MKHealthSchool
//
//  Created by QAING CHEN on 17/4/10.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import "SignalClass.h"

@implementation SignalClass

+ (SignalClass *)ShreSignal
{
    
    static SignalClass *help = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        help = [SignalClass new];
    });
    return help;
    
}

+ (AFHTTPSessionManager *)shareSessionManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 25.0f;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    return manager;
}

-(NSMutableArray *)markArray
{
    if (!_markArray) {
        _markArray = [NSMutableArray array];
    }
    return _markArray;
}


@end
