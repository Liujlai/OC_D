//
//  HomeViewController.m
//  OC_D
//
//  Created by idea on 2018/3/26.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "HomeViewController.h"
#import "Person.h"
#import "Dog.h"
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
//    [self download];
    
    // 获取网络缓存大小
    NSLog(@"网络缓存大小cache = %fKB",[PPNetworkCache getAllHttpCacheSize]/1024.f);
    
    // 清理缓存 [PPNetworkCache removeAllHttpCache];
    
    /**
     设置网络请求参数的格式:默认为二进制格式
     PPRequestSerializerJSON(JSON格式),
     PPRequestSerializerHTTP(二进制格式)
     
     设置方式 : [PPNetworkHelper setRequestSerializer:PPRequestSerializerHTTP];
     */
    
    /**
     设置服务器响应数据格式:默认为JSON格式
     PPResponseSerializerJSON(JSON格式),
     PPResponseSerializerHTTP(二进制格式)
     
     设置方式 : [PPNetworkHelper setResponseSerializer:PPResponseSerializerJSON];
     */
    
    /**
     设置请求头 : [PPNetworkHelper setValue:@"value" forHTTPHeaderField:@"header"];
     */
    
    
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
//        NSString* json = [self jsonToString:responseObject];
//        NSError *err = nil;
//        Person *p = [[Person alloc] initWithString:json error:&err];
//        NSLog(@"😶%@-----%d",p.name,p.id);
    } failure:^(NSError *error) {
         NSLog(@"err = %@",error);
    }];
}
//自动缓存
-(void)loadDataCache
{
    [PPNetworkHelper GET:dataUrl parameters:nil responseCache:^(id responseCache) {
        NSLog(@"🐱%@",responseCache);
        if(responseCache){
            Dog *d = [Dog yy_modelWithJSON:responseCache];
            NSArray * arr = [[NSArray alloc] init];
            arr = @[d,d,d];
            NSLog(@"%@--%lld",d.name,d.uid);
            NSLog(@"🤫%@",arr);
            NSLog(@"😶%@",arr[1]);
            NSLog(@"🤢%@",arr[2]);
        }

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
//        NSString* json = [self jsonToString:responseCache];
        NSError *err = nil;
        Person *p = [[Person alloc] initWithDictionary:responseCache error:&err];
        NSLog(@"🤫,%d---%@---%d",p.number,p.text,p.isbool);
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

/**
 *  json转字符串
 */
- (NSString *)jsonToString:(NSDictionary *)dic
{
    if(!dic){
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
