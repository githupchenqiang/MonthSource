//
//  MJRefreshNormalHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJRefreshNormalHeader.h"

@interface MJRefreshNormalHeader()
{
    __weak UIImageView *_arrowView;
}
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;
@end

@implementation MJRefreshNormalHeader
#pragma mark - 懒加载子控件
- (UIImageView *)arrowView
{
    if (!_arrowView) {
        UIImage *image = [UIImage imageNamed:MJRefreshSrcName(@"shuaxin.png")];
        if (!image) {
            image = [UIImage imageNamed:MJRefreshFrameworkSrcName(@"shuaxin.png")];
        }
        UIImageView *arrowView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:_arrowView = arrowView];
    }
    return _arrowView;
}

- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

#pragma mark - 公共方法
- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    
    self.loadingView = nil;
    [self setNeedsLayout];
}

#pragma makr - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    // 箭头
#warning 修改
    self.arrowView.mj_size = CGSizeMake(18, 18); //self.arrowView.image.size;
    CGFloat arrowCenterX = self.mj_w * 0.5;
    if (!self.stateLabel.hidden) {
        arrowCenterX -= 100;
    }
    CGFloat arrowCenterY = self.mj_h * 0.5;
    self.arrowView.center = CGPointMake(arrowCenterX, arrowCenterY);
    
    // 圈圈
    self.loadingView.frame = self.arrowView.frame;
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStateIdle) {
        if (oldState == MJRefreshStateRefreshing) {
#warning 修改
//            self.arrowView.transform = CGAffineTransformIdentity;
            [self.arrowView.layer removeAllAnimations];
            [UIView animateWithDuration:MJRefreshSlowAnimationDuration animations:^{
                self.loadingView.alpha = 0.0;
            } completion:^(BOOL finished) {
                // 如果执行完动画发现不是idle状态，就直接返回，进入其他状态
                if (self.state != MJRefreshStateIdle) return;
                
                self.loadingView.alpha = 1.0;
                [self.loadingView stopAnimating];
                self.arrowView.hidden = NO;
            }];
        } else {
            [self.loadingView stopAnimating];
            self.arrowView.hidden = NO;
            [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
                self.arrowView.transform = CGAffineTransformIdentity;
            }];
        }
    } else if (state == MJRefreshStatePulling) {
        [self.loadingView stopAnimating];
        self.arrowView.hidden = NO;
        [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
//            self.arrowView.transform = CGAffineTransformMakeRotation(0.000001 - M_PI);
        }];
    } else if (state == MJRefreshStateRefreshing) {
//        self.loadingView.alpha = 1.0; // 防止refreshing -> idle的动画完毕动作没有被执行
//        [self.loadingView startAnimating];
//        self.arrowView.hidden = YES;
        [self layerRotation:self.arrowView];
    }
}
- (void)layerRotation:(UIView *)view
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = .5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1000;
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
@end
