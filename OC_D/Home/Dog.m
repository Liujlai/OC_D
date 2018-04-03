//
//  Dog.m
//  OC_D
//
//  Created by idea on 2018/3/30.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "Dog.h"

@implementation Dog
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"uid" : @"id"};
}
@end
