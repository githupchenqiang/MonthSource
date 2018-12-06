//
//  CQ_NetWorkCache.m
//  AFNetHelp
//
//  Created by QAING CHEN on 17/3/3.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import "CQ_NetWorkCache.h"
#import "YYCache.h"

@implementation CQ_NetWorkCache
static NSString *const NetWorkResponseCache = @"CQ_NetResponse";
static YYCache *_dataCache;

+ (void)initialize
{
    _dataCache = [YYCache cacheWithName:NetWorkResponseCache];
}

+ (void)setHttpCache:(id)httpData Url:(NSString *)Url parameters:(NSDictionary *)parameters
{
    NSString *cacheKey = [self cacheKeyWithUrl:Url parameters:parameters];
    //异步存储
    [_dataCache setObject:httpData forKey:cacheKey withBlock:nil];
}


+ (id)httpCacheForURL:(NSString *)URL parameters:(NSDictionary *)parmeters
{
    NSString *cacheKey = [self cacheKeyWithUrl:URL parameters:parmeters];
    return  [_dataCache objectForKey:cacheKey];
}

+ (void)httpCacheForURL:(NSString *)URL parameters:(NSDictionary *)parameters WithBlock:(void (^)(id<NSCoding>))block
{
    NSString *cacaheKey = [self cacheKeyWithUrl:URL parameters:parameters];
    [_dataCache objectForKey:cacaheKey withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
       dispatch_async(dispatch_get_main_queue(), ^{
           block(object);
       });
    }];
}


+ (NSInteger)getAllHttpCacheSize
{
    return [_dataCache.diskCache totalCost];
}

+ (void)removeAllHttpCache
{
    [_dataCache.diskCache removeAllObjects];
}


+ (NSString *)cacheKeyWithUrl:(NSString *)URL parameters:(NSDictionary *)parameters
{
    if (!parameters) {return URL;};
    //将参数字典转换成字符串
    NSData *stringData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    NSString *paraString = [[NSString alloc]initWithData:stringData encoding:NSUTF8StringEncoding];
    
    //将URL与转换好的参数字符串拼接在一起 ,成为最终的存储字节
    NSString *cacheKey = [NSString stringWithFormat:@"%@%@",URL,paraString];
    return cacheKey;
}


@end
