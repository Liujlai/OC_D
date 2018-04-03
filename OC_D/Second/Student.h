//
//  Student.h
//  OC_D
//
//  Created by idea on 2018/3/29.
//  Copyright © 2018年 idea. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct{
    int year;
    int month;
    int day;
} Data;

@interface Student : NSObject
{
    @public
    NSString *_name;
    Data _birthday;
}
@property(nonatomic ,strong)NSString *str;
-(void)say;
@end
