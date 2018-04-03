//
//  Person.h
//  OC_D
//
//  Created by idea on 2018/3/30.
//  Copyright © 2018年 idea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface Person : JSONModel

@property(assign ,nonatomic) int number;
@property(strong,nonatomic)NSString *text;
@property(assign,nonatomic)int isbool;

@end
