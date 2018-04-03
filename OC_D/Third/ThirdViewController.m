//
//  ThirdViewController.m
//  OC_D
//
//  Created by idea on 2018/3/26.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdCell.h"

@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong)UITableView *tableView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ThirdViewController";
    [self tableView];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView
{
    if(_tableView == nil){
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[ThirdCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        _tableView.makeCons(^{
            make.edge.equal.constants(0);
        });
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            Alert.title(@"刷新界面").action(@"😹", nil).show();
            [_tableView.mj_header endRefreshing];
        }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            Alert.title(@"加载更多").action(@"👺", nil).show();
            [_tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleTh.text = @"!@#$%^&&&*()_";
    cell.icon.backgroundColor = [UIColor cyanColor];
    cell.subtitleTh.text = @"skkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllkkkfkkffflflfllfllflfl";
    cell.timeTh.text = @"2018-04-02";
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

@end
