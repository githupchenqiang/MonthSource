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

@interface PageScrolelrViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView     *tableView;
@property (nonatomic,strong)NSMutableArray  *mutArray;
@property (nonatomic,assign)BOOL            loadMore;
@property (nonatomic,assign)NSInteger       page;
@property (nonatomic ,strong)UITableView                            *table;

@end

@implementation PageScrolelrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    _page = 1;
    _loadMore = NO;
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        Mas_Top(self.view,0);
        Mas_left(self.view, 0);
        Mas_Right(self.view, 0);
        Mas_bottom(self.view,0);
    }];
    [self GetDataFromeServer];
}

-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _table;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"9999";
    return  cell;
}

- (void)GetDataFromeServer{
    [NetWorking getDataFromServerWithUrlString:mainUrl([PublicSource DeviceUUID], 1, 1) parame:nil success:^(NSDictionary *RequestResponse) {
        NSLog(@"%@",RequestResponse);
        
        NSArray *dataArray = RequestResponse[@"data"][@"recipes"];
        
        NSArray *array = [HomeModel mj_objectArrayWithKeyValuesArray:dataArray];
        
        HomeModel *model = array[2];
        
        HomeImageURl(model.imgurl);
        
        NSLog(@"%@", HomeImageURl(model.imgurl));
        
        NSLog(@"%ld",array.count);
        
    } faile:^(NSError *error) {
        
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
