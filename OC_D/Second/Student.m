//
//  Student.m
//  OC_D
//
//  Created by idea on 2018/3/29.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)say
{
    NSLog(@"姓名：%@，生日：%i-%i-%i",_name,_birthday.year,_birthday.month,_birthday.day);
}
@end
