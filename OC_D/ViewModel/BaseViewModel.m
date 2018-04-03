//
//  BaseViewModel.m
//  OC_D
//
//  Created by idea on 2018/4/3.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

-(void)cacelTask{
    [self.dataTask cancel];
}
- (void)suspendTask{
    [self.dataTask suspend];
}
-(void)resumeTask{
    [self.dataTask resume];
}
- (NSMutableArray *)dataMArr
{
    if(!_dataMArr){
        _dataMArr = [NSMutableArray new];
    }
    return _dataMArr;
}
@end
