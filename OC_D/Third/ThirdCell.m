//
//  ThirdCell.m
//  OC_D
//
//  Created by idea on 2018/4/2.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "ThirdCell.h"


@implementation ThirdCell


-(UILabel *)titleTh
{
    if(_titleTh == nil){
        _titleTh = [[UILabel alloc]init];
        _titleTh.font = kTitleFont;
        [self.contentView addSubview:_titleTh];
        [self setupUI];
    }
    return  _titleTh;
}
- (UIImageView *)icon
{
    if (_icon == nil){
        _icon = [[UIImageView alloc]init];
        [self.contentView addSubview:_icon];
        _icon.makeCons(^{
            make.top.equal.view(self.titleTh).bottom.constants(10);
            make.left.equal.constants(10);
            make.right.equal.constants(-10);
            make.height.equal.constants(200);

        });
    }
    return _icon;
}
- (UILabel *)subtitleTh
{
    if(_subtitleTh == nil){
        _subtitleTh = [[UILabel alloc]init];
        _subtitleTh.font = kSubtitleFont;
        _subtitleTh.lines(0);
        [self.contentView addSubview:_subtitleTh];
        _subtitleTh.makeCons(^{
            make.width.equal.constants(KSCREEN_WIDTH/4*3-50);
            make.top.equal.view(self.icon).bottom.constants(10);
            make.left.equal.constants(10);
            make.bottom.constants(-10);
        });
    }
    return _subtitleTh;
}

- (UILabel *)timeTh
{
    if (_timeTh ==nil) {
        _timeTh = [[UILabel alloc]init];
        _timeTh.font = kSubtitleFont;
        [self.contentView addSubview:_timeTh];
        _timeTh.makeCons(^{
            make.right.equal.constants(-10);
            make.width.equal.constants(80);
            make.centerY.equal.view(self.subtitleTh);
        });
        UIImageView *timeImg = [UIImageView new];
        timeImg.image = [UIImage imageNamed:@"account_highlight"];
        [self.contentView addSubview:timeImg];
        timeImg.makeCons(^{
            make.centerY.equal.view(self.subtitleTh);
            make.size.equal.constants(15,15);
            make.right.equal.view(_timeTh).left.constants(-3);
        });
    }
    return _timeTh;
}

-(void)setupUI
{
    _titleTh.makeCons(^{
        make.left.top.equal.superview.constants(10);
        make.right.equal.constants(-10);
    });
}
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
