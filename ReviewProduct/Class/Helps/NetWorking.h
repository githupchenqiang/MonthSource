//
//  NetWorking.h
//  MKHealthSchool
//
//  Created by QAING CHEN on 17/3/2.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#import "CQ_CacheNetWorkHelper.h"

typedef void(^RequestSuccess)(NSDictionary *RequestResponse);
typedef void(^RequestFaile)(NSError *error);
typedef void(^format)(id<AFMultipartFormData> formData);

@interface NetWorking : NSObject




/**
 请求数据
 
 @param url URl
 @param parameters 参数
 @param cache 是否需要缓存
 @param success 成功返回
 @param faile 失败返回
 */
+ (void)PostUrlString:(NSString *)url paragram:(id)parameters isCache:(BOOL)cache success:(RequestSuccess)success faile:(RequestFaile)faile;


/**
 全地址请求数据

 @param url url
 @param parameters 参数
 @param cache 是否需要缓存数据
 @param success 成功返回
 @param faile 失败返回
 */
+(void)PostAllUrl:(NSString *)url paragram:(id)parameters isCache:(BOOL)cache success:(RequestSuccess)success faile:(RequestFaile)faile;



/**
 上传图片文字到服务器

 @param URLString Url
 @param parameteres 参数
 @param form data
 @param success 成功返回
 @param failure 失败返回
 */
+ (void)postFormData:(NSString *)URLString Parameters:(NSDictionary *)parameteres constructingBodyBlock:(format)form success:(RequestSuccess)success failure:(RequestFaile)failure;



/**
 全返回值全URl
 @param UrlString 全URL
 @param paraneters 参数
 @param cache YES Or NO
 @param success success
 @param faile faile
 */
+ (void)responseAllMessgaeWithAllUrl:(NSString *)UrlString parameters:(NSDictionary *)paraneters isCache:(BOOL)cache success:(RequestSuccess)success faile:(RequestFaile)faile;



/**
 URl参数返回值

 @param String Url参数
 @param paraneters 参数
 @param cache YES or NO
 @param success 成功返回
 @param faile 失败返回
 */
+ (void)responseAllMessgaeWithString:(NSString *)String parameters:(NSDictionary *)paraneters isCache:(BOOL )cache success:(RequestSuccess)success faile:(RequestFaile)faile;





/**
 全返回值 拼接URL请求  没有分页的数据

 @param String 请求URL 拼接数据
 @param paraneters 请求参数
 @param pageType 页面标志
 @param cache 是否缓存数据
 @param success 请求成功的回调
 @param faile 请求失败的回调
 */
+ (void)responseAllMessgaeWitUrlhString:(NSString *)String parameters:(NSDictionary *)paraneters pageType:(NSDictionary *)pageType isCache:(BOOL )cache success:(RequestSuccess)success faile:(RequestFaile)faile;


/**
 get

 @param string 请求
 @param success dict
 @param faile dict
 */
+ (void)getDataFromServerWithUrlString:(NSString *)string parame:(NSDictionary *)param success:(RequestSuccess)success faile:(RequestFaile)faile;




+ (void)getSerchDataWithUrlString:(NSString *)string parame:(NSDictionary *)param success:(void(^)(NSDictionary * response))success faile:(void(^)(NSError *error))faile;

@end
