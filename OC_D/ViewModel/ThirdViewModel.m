//
//  ThirdViewModel.m
//  OC_D
//
//  Created by idea on 2018/4/3.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "ThirdViewModel.h"

@implementation ThirdViewModel

- (NSInteger)rowNum{
    return self.dataMArr.count;
}
//- (NSString *)titleForRow:(NSInteger)row{
//    return [self m]
//}
//- (NSURL *)iconURLForRow:(NSInteger)row{
//    return [NSURL URLWithString:[self mod]]
//}

- (void)getDataFromNetCompletionHandler:(completionHandler)completionHandler
{
    
}
- (void)refreshDataCompletionHandler:(completionHandler)completionHandler
{
    self.page = 0;
     [self getDataFromNetCompletionHandler:completionHandler];
}
- (void)getMoreDataCompletionHandler:(completionHandler)completionHandler
{
    self.page += 10;
    [self getDataFromNetCompletionHandler:completionHandler];
}
@end
