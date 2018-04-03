//
//  BaseViewModel.h
//  OC_D
//
//  Created by idea on 2018/4/3.
//  Copyright © 2018年 idea. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^completionHandler)(NSError *error);
@protocol BaseViewModelDelegate<NSObject>

@optional
//获取数据
-(void)getDataFromNetCompletionHandler:(completionHandler)completionHandler;
//刷新
-(void)refreshDataCompletionHandler:(completionHandler)completionHandler;
//加载更多
- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler;
@end

@interface BaseViewModel : NSObject <BaseViewModelDelegate>

@property (nonatomic ,strong)NSMutableArray *dataMArr;
@property(nonatomic ,strong)NSURLSessionDataTask *dataTask;

//取消任务
-(void)cacelTask;
//暂停任务
-(void)suspendTask;
//继续任务
-(void)resumeTask;


@end
