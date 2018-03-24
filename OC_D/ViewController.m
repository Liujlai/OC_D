//
//  ViewController.m
//  OC_D
//
//  Created by idea on 2018/3/24.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/**
NSLog的格式输出如下：
%@        对象 、字符串
%d, %i   整数
%u          无符整型
%f           浮点/双字
%x, %X   二进制整数
%o          八进制整数
%zu        size_t
%p          指针
%e          浮点/双字 （科学计算）
%g          浮点/双字
%s C      字符串
%.*s        Pascal字符串
%c           字符
%C          unichar
%lld        64位长整数（long long）
%llu        无符64位长整数
%Lf         64位双字
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"KSCREEN_WIDTH:%ff",KSCREEN_WIDTH);
    NSLog(@"KSCREEN_HEIGHT:%f",KSCREEN_HEIGHT);
    NSLog(@"KSTATUSBARHEIGHT:%f",KSTATUSBARHEIGHT);
    NSLog(@"KNAVIGATIONANDSTATUSBARHEIGHT:%f",KNAVIGATIONANDSTATUSBARHEIGHT);
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}

- (void)setupUI
{
    _kview = [[UIView alloc] initWithFrame:CGRectMake(0, KNAVIGATIONANDSTATUSBARHEIGHT, KSCREEN_WIDTH, 50)];
    _kview.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_kview];
    
    _lab = [[UILabel alloc]init];
    _lab.frame = CGRectMake(20, KNAVIGATIONANDSTATUSBARHEIGHT+60, KSCREEN_WIDTH-40, 50);
    _lab.backgroundColor = [UIColor redColor];
    [self.view addSubview:_lab];
    
    _btn = [[UIButton alloc]init];
    [_btn setTitle:@"炉烟缭绕" forState:(UIControlStateNormal)];
    [_btn sizeToFit];
    _btn.frame = CGRectMake(30, KNAVIGATIONANDSTATUSBARHEIGHT+120, KSCREEN_WIDTH-60, 50);
    _btn.backgroundColor = [UIColor purpleColor];
    [_btn addTarget:self action:(@selector(jump:)) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_btn];
}

-(void)jump:(id)sender{
    _lab.text = @"yun bi hua yan";
    _lab.font = [UIFont systemFontOfSize:13];
    _lab.tintColor = [UIColor blueColor];
    _lab.textColor = [UIColor whiteColor];
    _lab.textAlignment = NSTextAlignmentCenter;
//    NSLog(@"sender:%@",sender);
    AViewController *vc  = [[AViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (BOOL)iPhoneX
{
    static BOOL b;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        b = CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size);
    });
    return b;
}
@end
