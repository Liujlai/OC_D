//
//  Person.m
//  OC_D
//
//  Created by idea on 2018/3/30.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "Person.h"

@implementation Person

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"isbool":@"bool"}];
}

@end


