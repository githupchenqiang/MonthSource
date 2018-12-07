//
//  HomeCollectionViewCell.h
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/7.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UILabel *Titlte;
@property (weak, nonatomic) IBOutlet UILabel *DesLabel;
@property (nonatomic ,strong)HomeModel         *model;
@end

NS_ASSUME_NONNULL_END
