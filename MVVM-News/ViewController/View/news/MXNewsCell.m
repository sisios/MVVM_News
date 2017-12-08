//
//  MXNewsCell.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXNewsCell.h"
@interface MXNewsCell()
{
    UIImageView *_icon;
    UILabel *_title;
    UILabel *_date;
    UILabel *_count;
    
}
@end

@implementation MXNewsCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self drawView];
    }
    return self;
    
}
-(void)drawView {
    _icon = [[UIImageView alloc]init];
    
//    _icon.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_icon];
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(80, 60));
        make.centerY.mas_equalTo(0);// _icon的中心点y等于cell的中心点y
        
    }];
    
    _title = [[UILabel alloc]init];
    _title.textColor = [UIColor blackColor];
    _title.textAlignment = NSTextAlignmentLeft;
    _title.numberOfLines = 2;
    _title.font = [UIFont systemFontOfSize:18.f];
    [self.contentView addSubview:_title];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(_icon);
        make.left.mas_equalTo(_icon.mas_right).mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    _date = [[UILabel alloc]init];
    _date.textColor = [UIColor lightGrayColor];
    _date.textAlignment = NSTextAlignmentLeft;
    _date.numberOfLines = 1;
    _date.font = [UIFont systemFontOfSize:15.f];
    [self.contentView addSubview:_date];
    [_date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.equalTo(_title);
        make.bottomMargin.equalTo(_icon);
        make.width.mas_equalTo(120);
        
    }];
    _count = [[UILabel alloc]init];
    _count.textColor = [UIColor lightGrayColor];
    _count.font = [UIFont systemFontOfSize:15.f];
    _count.textAlignment = NSTextAlignmentRight;
    _count.numberOfLines = 1;
    [self.contentView addSubview:_count];
    [_count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-10);
        make.bottomMargin.mas_equalTo(_date);
        make.left.mas_equalTo(_date.mas_right);
        
    }];
   
    
}
-(void)setModel:(MXNewsListModel *)model {
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.smallpic] placeholderImage:[UIImage imageNamed:@"car"]];
     _title.text = model.title;
     _date.text = model.time;
    if (model.mediatype == 3) { // 视频
        _count.text = [NSString stringWithFormat:@"%ld播放",model.replycount];
    } else {
        _count.text = [NSString stringWithFormat:@"%ld评论",model.replycount];
    }
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
