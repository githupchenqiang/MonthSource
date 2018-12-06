//
//  HomeModel.h
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/5.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface HomeModel : NSObject
@property (nonatomic,assign)NSInteger            ID;
@property (nonatomic,strong)NSString            *title;
@property (nonatomic,strong)NSString            *Fooddescription;
@property (nonatomic,strong)NSString            *page_url;
@property (nonatomic,strong)NSString            *imgurl;
@property (nonatomic,assign)NSInteger            dayleft;

@end
