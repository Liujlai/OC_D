//
//  AViewController.h
//  OC_D
//
//  Created by idea on 2018/3/24.
//  Copyright © 2018年 idea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UILabel *lab1;
@property(nonatomic,strong)UIButton *btn1;

@property(nonatomic,strong)UITableView *table;
-(void)setupBtnUI;
@end
