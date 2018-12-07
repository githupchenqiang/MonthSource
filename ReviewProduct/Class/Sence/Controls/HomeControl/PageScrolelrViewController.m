//
//  PageScrolelrViewController.m
//  ReviewProduct
//
//  Created by AmpleSky on 2018/12/6.
//  Copyright © 2018年 AmpleSky. All rights reserved.
//

#import "PageScrolelrViewController.h"
#import "NetWorking.h"
#import "HomeModel.h"
#import "MJExtension.h"
#import "HomeCollectionViewCell.h"
#import "ReviewProduct-Swift.h"
#import "MJRefresh.h"
#import "DetailViewController.h"
@interface PageScrolelrViewController ()<UICollectionViewDataSource,cqWaterFlowLayoutDelegate,UICollectionViewDelegate>
@property (nonatomic,strong)UITableView                          *tableView;
@property (nonatomic,strong)NSMutableArray                       *mutArray;
@property (nonatomic,assign)BOOL                                 loadMore;
@property (nonatomic,assign)int                                     page;
@property (nonatomic ,strong)UICollectionView                       *collec;
@property (nonatomic ,strong)cqWaterFlowLayout                      *layout;


@end

@implementation PageScrolelrViewController
static NSString *Collecell = @"collec";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
   
    [self.view addSubview:self.collec];
    [_collec.header endRefreshing];
   self.collec.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        self.loadMore = NO;
        [self GetDataFromeServer];
   }];
    
    self.collec.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       self.page++;
        self.loadMore = YES;
        [self GetDataFromeServer];
    }];
    [_collec.header beginRefreshing];
}

- (UICollectionView *)collec{
    if (!_collec) {
        _layout = [[cqWaterFlowLayout alloc]init];
        _layout.delegate = self;
        
        
        _collec = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight- [PublicSource TabbarHeight]-35) collectionViewLayout:_layout];
        [_collec registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:Collecell];
        _collec.dataSource = self;
        _collec.delegate = self;
        _collec.backgroundColor = [UIColor py_colorWithHexString:@"C9C9C9"];
    }
    return _collec;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mutArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Collecell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    HomeModel *model = [self.mutArray objectAtIndex:indexPath.row];
    [cell.Image sd_setImageWithURL:[NSURL URLWithString:HomeImageURl(model.imgurl)] placeholderImage:[UIImage imageNamed:@""]];
    cell.Titlte.text = model.title;
    cell.DesLabel.text = model.Fooddescription;
    return cell;
}

- (CGFloat)columnCountInWaterflowLayoutWithWaterflowLayout:(cqWaterFlowLayout *)waterflowLayout{
    return 2;
}

- (CGFloat)waterflowLayoutWithWaterflowLayout:(cqWaterFlowLayout *)waterflowLayout heightForItemIndex:(NSInteger)heightForItemIndex itemWidth:(CGFloat)itemWidth{
    
    
    if (heightForItemIndex%2 == 0) {
       return 250;
    }else{
        return 200;
    }
    
    
}



- (CGFloat)columnMarginInWaterflowLayoutWithWaterflowLayout:(cqWaterFlowLayout *)waterflowLayout{
    return 5;
}

- (CGFloat)rowMarginInWaterflowLayoutWithWaterflowLayout:(cqWaterFlowLayout *)waterflowLayout{
    return 5;
}

- (UIEdgeInsets)edgeInsetsInWaterflowLayoutWithWaterflowLayout:(cqWaterFlowLayout *)waterflowLayout{
    return UIEdgeInsetsMake(0, 5, 10, 5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detail = [[DetailViewController alloc]init];
    HomeModel *model = [self.mutArray objectAtIndex:indexPath.row];
    detail.model = model;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)GetDataFromeServer{
   
    [NetWorking getDataFromServerWithUrlString:mainUrl([PublicSource DeviceUUID],_Month, self.page) parame:nil success:^(NSDictionary *RequestResponse) {
        NSLog(@"%@",RequestResponse);
        NSArray *dataArray = RequestResponse[@"data"][@"recipes"];
        NSArray *array = [HomeModel mj_objectArrayWithKeyValuesArray:dataArray];
       
        
        NSMutableArray *mutarray = [array mutableCopy];
        
        [self.collec.header endRefreshing];
        [self.collec.footer endRefreshing];
        //遍历记录广告数据的下标
        for (int i = 0; i < array.count; i++) {
            if ((i+1)%4 == 0) {
                HomeModel *model = array[i];
                [mutarray removeObject:model];
            }
        }
        
        if (self.loadMore) {
            for (HomeModel *model in mutarray) {
                [self.mutArray addObject:model];
            }
        }else{
            self.mutArray = [mutarray mutableCopy];
        }
        [self.collec reloadData];
    } faile:^(NSError *error) {
       [self.collec.header endRefreshing];
    }];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
