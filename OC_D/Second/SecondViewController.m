//
//  SecondViewController.m
//  OC_D
//
//  Created by idea on 2018/3/26.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "SecondViewController.h"
#import "Student.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"SecondViewController";
    [self setupUI];
    _lab.onClick((^(UILabel *lab){
        //        Alert.title(@"提示").message(@"Message").action(@"OK",^{}).show();
        Student *st = [Student new];
        st -> _name = @"idea";
        st -> _birthday.year = 2222;
        st -> _birthday.month = 07;
        st -> _birthday.day = 99;
        [st say];
        
        Data d = {3333,22,33};
        Data dd;
        dd = d;
        dd.year = 5555;
        st.str = @"eeee";
        NSLog(@"🤥%i---%@---%i",d.year,st.str,dd.year);
        Alert.title(@"提示")
        .message(@"提示提示提示提示提示提示.")
        .action(@"取消", nil)
        .tint(@"green")
        .action(@"确认", nil)
        .show();
        ActionSheet.title(@"Title").message(@"Message").action(@"OK",^{}).show();
    }));
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)setupUI
{
    _lab = Label.bgColor(@"red")
    .xy(50,KNAVIGATIONANDSTATUSBARHEIGHT+10)
    .wh(100,50)
    .borderRadius(25)
    .addTo(self.view);
    
    _kView = View.xywh(20,
                       KNAVIGATIONANDSTATUSBARHEIGHT+80,
                       100,
                       100)
    .bgColor(@"cyan")
    .opacity(0.7)
    .border(3,@"d3d3d3")
    .addTo(self.view);
    _Kbtn = Button.xywh(20,
                        KNAVIGATIONANDSTATUSBARHEIGHT+180,
                        100,
                        50)
    .borderRadius(5)
    .bgImg(@"blue,0.5")
    .highImg(@"orange")
    .addTo(self.view);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
