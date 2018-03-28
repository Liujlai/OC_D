//
//  HomeViewController.m
//  OC_D
//
//  Created by idea on 2018/3/26.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "HomeViewController.h"
static NSString *const dataUrl = @"https://idealjl.herokuapp.com/aaa";
static NSString *const downloadUrl = @"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
@interface HomeViewController ()

@end


@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //AFNetworking请求
    [self loadData];
    [self loadData1];
    [self loadDataCache];
    [self loadPostDataCache];
    [self download];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getCurrentNetworkStatus];
    });
}
//AFNetworking请求
-(void)loadData
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    [mgr GET:@"https://idealjl.herokuapp.com/aaa" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"🐹%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"err = %@",error);
    }];
}
//无缓存GET 请求
-(void)loadData1
{
    [PPNetworkHelper GET:dataUrl parameters:nil success:^(id responseObject) {
        NSLog(@"🦊%@",responseObject);
    } failure:^(NSError *error) {
         NSLog(@"err = %@",error);
    }];
}
//自动缓存
-(void)loadDataCache
{
    [PPNetworkHelper GET:dataUrl parameters:nil responseCache:^(id responseCache) {
        NSLog(@"🐱%@",responseCache);
    } success:^(id responseObject) {
        NSLog(@"🐸%@",responseObject);
    } failure:^(NSError *error) {
         NSLog(@"err = %@",error);
    }];
}

//自动缓存
-(void)loadPostDataCache
{
    [PPNetworkHelper POST:@"https://idealjl.herokuapp.com/json" parameters:nil responseCache:^(id responseCache) {
        NSLog(@"🐳%@",responseCache);
    } success:^(id responseObject) {
        NSLog(@"👹%@",responseObject);
    } failure:^(NSError *error) {
        NSLog(@"👺err = %@",error);
    }];
}

#pragma mark - 一次性获取当前最新网络状态
- (void)getCurrentNetworkStatus
{
    if (kIsNetwork) {
        NSLog(@"有网络");
        if (kIsWWANNetwork) {
            NSLog(@"手机网络");
        }else if (kIsWiFiNetwork){
            NSLog(@"WiFi网络");
        }
    } else {
        NSLog(@"无网络");
    }
}
#pragma mark - 文件下载
-(void)download
{
    [PPNetworkHelper downloadWithURL:downloadUrl fileDir:@"Download" progress:^(NSProgress *progress) {
        CGFloat stauts = 100.f * progress.completedUnitCount/progress.totalUnitCount;
        
        NSLog(@"下载进度 :%.2f%%,,%@",stauts,[NSThread currentThread]);
    } success:^(NSString *filePath) {
        NSLog(@"文件路径: %@",filePath);
    } failure:^(NSError *error) {
        NSLog(@"下载失败: %@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
