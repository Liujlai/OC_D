//
//  ThirdViewModel.h
//  OC_D
//
//  Created by idea on 2018/4/3.
//  Copyright © 2018年 idea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@interface ThirdViewModel : BaseViewModel

@property(nonatomic)NSInteger rowNum;

-(NSURL *)iconURLForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)subtitleForRow:(NSInteger)row;
-(NSString *)timeForRow:(NSInteger)row;

@property(nonatomic)NSInteger page;

@end
