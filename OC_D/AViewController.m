//
//  AViewController.m
//  OC_D
//
//  Created by idea on 2018/3/24.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lab1 = [[UILabel alloc]init];
    _lab1.text = @"🧐";
    _lab1.font = [UIFont systemFontOfSize:32];
    //    [_lab1 sizeToFit];
    _lab1.textAlignment = NSTextAlignmentCenter;
    _lab1.frame = CGRectMake(0, KNAVIGATIONANDSTATUSBARHEIGHT, KSCREEN_WIDTH, 60);
    _lab1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_lab1];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupBtnUI];
    [self.view addSubview:self.table];
}

-(void)setupBtnUI
{
    _btn1 = [[UIButton alloc]init];
    _btn1.frame = CGRectMake(0, KNAVIGATIONANDSTATUSBARHEIGHT+80, KSCREEN_WIDTH, 50);
    _btn1.backgroundColor = [UIColor purpleColor];
    [_btn1 addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_btn1];
}

-(void)click
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                              KNAVIGATIONANDSTATUSBARHEIGHT+130,
                                                              KSCREEN_WIDTH,
                                                              KSCREEN_HEIGHT-KNAVIGATIONANDSTATUSBARHEIGHT-130
                                                              ) style:(UITableViewStylePlain)];
        _table.delegate = self;
        _table.dataSource  = self;
        _table.showsVerticalScrollIndicator = NO;
        
    }
    return _table;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    return cell;
}
@end
