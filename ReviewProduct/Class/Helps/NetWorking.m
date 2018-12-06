//
//  NetWorking.m
//  MKHealthSchool
//
//  Created by QAING CHEN on 17/3/2.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import "NetWorking.h"
#import "SignalClass.h"
#define Sessionmanager [SignalClass shareSessionManager]

@implementation NetWorking

+ (void)PostUrlString:(NSString *)url paragram:(id)parameters isCache:(BOOL)cache success:(RequestSuccess)success faile:(RequestFaile)faile
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
     NSString *string = [@"" stringByAppendingString:url];
    if (cache) {
        [CQ_CacheNetWorkHelper POST:string parameters:parameters responseCache:^(id responseCache) {
            NSString *result = responseCache[@"code"];
            if ([result isEqual:@200]) {
                success(responseCache);
            }else
            {
                NSString *msg = responseCache[@"message"];
                [PublicSource showAlertWithdelay:1 string:msg];
            }
        } success:^(id responseObject) {
            NSString *result = responseObject[@"code"];
            if ([result isEqual:@200]) {
                success(responseObject[@"data"]);
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            }else
            {
                NSString *msg = responseObject[@"message"];
                [PublicSource showAlertWithdelay:1 string:msg];
            }
        } failure:^(NSError *error) {
            faile(error);
        }];
        
    }else
    {
       
        [Sessionmanager POST:string parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
                success(responseObject);
           [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            faile(error);
        }];
    }
}



+(void)PostAllUrl:(NSString *)url paragram:(id)parameters isCache:(BOOL)cache success:(RequestSuccess)success faile:(RequestFaile)faile
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if (cache) {
       [CQ_CacheNetWorkHelper POST:url parameters:parameters responseCache:^(id responseCache) {
           NSString *result = responseCache[@"code"];
           if ([result isEqual:@200]) {
               success(responseCache);
           }else
           {
               NSString *msg = responseCache[@"message"];
               [PublicSource showAlertWithdelay:1 string:msg];
           }
        } success:^(id responseObject) {
            NSString *result = responseObject[@"code"];
            if ([result isEqual:@200]) {
                success(responseObject[@"data"]);
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            }else
            {
                NSString *msg = responseObject[@"message"];
                [PublicSource showAlertWithdelay:1 string:msg];
            }
        } failure:^(NSError *error) {
            faile(error);
        }];

    }else
    {
        
        [Sessionmanager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSData *data = [NSData dataWithData:responseObject];
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([responseObject[@"code"] isEqual:@200]) {
                NSDictionary *responsdict = [dict objectForKey:@"data"];
                success(responsdict);
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            }else
            {
                
                NSString *string = responseObject[@"msg"];
                [PublicSource showAlertWithdelay:1 string:string];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            faile(error);
        }];
    }
}

+ (void)postFormData:(NSString *)URLString Parameters:(NSDictionary *)parameteres constructingBodyBlock:(format)form success:(RequestSuccess)success failure:(RequestFaile)failure
{
    NSString *string = [@"" stringByAppendingString:URLString];
   [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [Sessionmanager POST:string parameters:parameteres constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (form) {
            form(formData);
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *data = [NSData dataWithData:responseObject];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        success(dict);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}



+ (void)responseAllMessgaeWithAllUrl:(NSString *)UrlString parameters:(NSDictionary *)paraneters isCache:(BOOL)cache success:(RequestSuccess)success faile:(RequestFaile)faile
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if (cache) {
        [CQ_CacheNetWorkHelper POST:UrlString parameters:paraneters responseCache:^(id responseCache) {
            success(responseCache);
        } success:^(id responseObject) {
            success(responseObject);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        } failure:^(NSError *error) {
            faile(error);
        }];
        
    }else
    {
        [Sessionmanager POST:UrlString parameters:paraneters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            success(responseObject);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            faile(error);
        }];
    }

}
+ (void)responseAllMessgaeWithString:(NSString *)String parameters:(NSDictionary *)paraneters isCache:(BOOL )cache success:(RequestSuccess)success faile:(RequestFaile)faile
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSString *Urlstring = [@"" stringByAppendingString:String];
    if (cache) {
        [CQ_CacheNetWorkHelper POST:Urlstring parameters:paraneters responseCache:^(id responseCache) {
              success(responseCache);
        } success:^(id responseObject) {
            success(responseObject);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        } failure:^(NSError *error) {
              faile(error);
        }];
    }else
    {
        
        [Sessionmanager POST:Urlstring parameters:paraneters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(responseObject);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            faile(error);
        }];
    }
}

+ (void)responseAllMessgaeWitUrlhString:(NSString *)String parameters:(NSDictionary *)paraneters pageType:(NSDictionary *)pageType isCache:(BOOL )cache success:(RequestSuccess)success faile:(RequestFaile)faile
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSString *Urlstring = [@"" stringByAppendingString:String];
    if (cache) {

        [CQ_CacheNetWorkHelper POST:Urlstring parameters:paraneters pageType:pageType responseCache:^(id responseCache) {
            success(responseCache);
            
        } success:^(id responseObject) {
            success(responseObject);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        } failure:^(NSError *error) {
            faile(error);
        }];
        
    }else
    {
        [Sessionmanager POST:Urlstring parameters:paraneters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSData *data = [NSData dataWithData:responseObject];
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            success(dict);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            faile(error);
        }];
    }
}
+ (void)getDataFromServerWithUrlString:(NSString *)string parame:(NSDictionary *)param success:(RequestSuccess)success faile:(RequestFaile)faile
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSString *Url = [@"" stringByAppendingString:string];
    
  
    
    [CQ_CacheNetWorkHelper GET:string parameters:param success:^(id responseObject) {
          success(responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    } failure:^(NSError *error) {

        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"%@",error);
        faile(error);
    }];
}

+ (void)getSerchDataWithUrlString:(NSString *)string parame:(NSDictionary *)param success:(void(^)(NSDictionary * response))success faile:(void(^)(NSError *error))faile
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSString *UrlString = [@"" stringByAppendingString:string];
    [CQ_CacheNetWorkHelper GET:UrlString parameters:param success:^(id responseObject) {
        success(responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    } failure:^(NSError *error) {
        faile(error);
    }];
}



@end
