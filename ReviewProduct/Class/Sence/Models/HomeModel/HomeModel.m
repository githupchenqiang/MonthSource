//
//  HomeModel.m
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/5.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID": @"id",@"Fooddescription":@"description"};
}
@end
