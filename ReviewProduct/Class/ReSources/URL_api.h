//
//  URL_api.h
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/5.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#ifndef URL_api_h
#define URL_api_h
#define mainUrl(UID,month,page) [NSString stringWithFormat:@"http://zhilehuo.com/app_matrix/recipe/api/QuiryRecipe?appname=banmiyunfushipu&version=6.40.0&os=ios&hardware=iphone&udid=%@&udids=fe3a34f0&month=%d&page=%d&info_flow_ad=true",UID,month,page]

//详情加载的图片
#define DetailImage(ID)  [NSString stringWithFormat:@"http://images0.zaijiawan.com/peanut/article/page_img/%d.jpg@!suggest_page_img_temp1",ID]

#define detailmainUrl(ID)  [NSString stringWithFormat:@"http://peanut.zhilehuo.com/peanut/suggestion.jsp?id=%ld",ID]

#define HomeImageURl(Name) [NSString stringWithFormat:@"http://images0.zaijiawan.com/peanut/article/%@@!suggest_page_img_temp1",Name]




//http://images0.zaijiawan.com/peanut/suggestion.jsp?id=3715@!suggest_page_img_temp1

#endif /* URL_api_h */
