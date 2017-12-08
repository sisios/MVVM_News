//
//  MXVideoCell.m
//  MVVM-News
//
//  Created by 未思语 on 04/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXVideoCell.h"
@interface MXVideoCell()
{
    UILabel *_title;
    UIImageView *_picImg;
    UIImageView *_timeImg;
    UILabel *_length;
    UIImageView *_playImg;
    
    
}
@end


@implementation MXVideoCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self drawCell];
    }
    return self;
    
}
- (void)drawCell {
    _title = [[UILabel alloc]init];
    _title.font = [UIFont systemFontOfSize:16.f];
    _title.textAlignment = NSTextAlignmentLeft;
    _title.numberOfLines = 0;
    [self.contentView addSubview:_title];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    _picImg = [[UIImageView alloc]init];
    [self.contentView addSubview:_picImg];
    [_picImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.rightMargin.mas_equalTo(_title);
        make.top.mas_equalTo(_title.mas_bottom).offset(5);
        make.height.mas_equalTo(200);
    }];
    
    _playImg = [[UIImageView alloc]init];
    _playImg.image = [UIImage imageNamed:@"play"];
    [_picImg addSubview:_playImg];
    [_playImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(_picImg);
    }];
    
    
    _length = [[UILabel alloc]init];
    _length.textColor = [UIColor lightGrayColor];
    _length.font = [UIFont systemFontOfSize:14.f];
    _length.numberOfLines = 1;
    _length.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_length];
    [_length mas_makeConstraints:^(MASConstraintMaker *make) {
        make.rightMargin.mas_equalTo(_title);
        make.top.mas_equalTo(_picImg.mas_bottom).offset(3);
        make.bottom.mas_equalTo(self.contentView).offset(-3);
    }];
    
    _timeImg = [[UIImageView alloc]init];
    _timeImg.image = [UIImage imageNamed:@"time"];
    [self.contentView addSubview:_timeImg];
    [_timeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_length.mas_left);
        make.topMargin.mas_equalTo(_length);
        make.height.width.mas_equalTo(_length.mas_height);
    }];
    
    
}
-(void)setModel:(MXVideoListModel *)model {
    _model = model;
    _title.text = model.title;
    [_picImg sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"cell_bg_noData"]];
    _length.text = [self getTime];
    
}
- (NSString *)getTime{
    NSString *time=  nil;
    NSInteger hour = 0;
    NSInteger min = 0;
    NSInteger sec = 0;
    hour = self.model.length /(60*60);
    if (hour>=1 &&hour<24) {
        time = [NSString stringWithFormat:@"%02ld",hour];
    }
    min =  self.model.length % (60*60) / 60;
    if (min>= 1 && min < 60) {
        time = [NSString stringWithFormat:@"%02ld:%02ld",hour,min];
    }
    sec = self.model.length % (60*60)%60;
    if (sec>=1&& sec< 60) {
        time = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",hour,min,sec];
    }
    
    return time;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
