//
//  CQ_NetWorkCache.h
//  AFNetHelp
//
//  Created by QAING CHEN on 17/3/3.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQ_NetWorkCache : NSObject


/**
 异步缓存网络数据
 根据请求的URL与parameters做存储数据
 缓存多级页面的数据

 @param httpData 服务器返回的数据
 @param Url 请求的URL地址
 @param parameters 请求参数
 */
+ (void)setHttpCache:(id)httpData Url:(NSString *)Url
                        parameters:(NSDictionary *)parameters;

/**
    根据请求的URL 与parameters取出缓存数据

 @param URL 请求URL
 @param parmeters 请求参数
 @return 缓存的服务器数据
 */
+ (id)httpCacheForURL:(NSString *)URL parameters:(NSDictionary *)parmeters;



/**
 根据请求URL 与parameters异步取出缓存数据

 @param URL 请求的URL
 @param parameters 请求的参数
 @param block 异步回调缓存的数据
 */
+ (void)httpCacheForURL:(NSString *)URL parameters:(NSDictionary *)parameters WithBlock:(void(^)(id<NSCoding>object))block;



/**
 获取网络缓存的总大小

 @return bytes(字节)
 */
+(NSInteger)getAllHttpCacheSize;


/**
 删除所有网络缓存
 */
+ (void)removeAllHttpCache;

@end
