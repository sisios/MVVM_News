//
//  MXChartsCell.m
//  MVVM-News
//
//  Created by 未思语 on 02/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXChartsCell.h"
@interface MXChartsCell()
{
    UIImageView *_picImg;
    UILabel *_title;
    UILabel *_count;
    
    
}
@end

@implementation MXChartsCell
-(void)setModel:(MXChartsModel *)model {
    _model = model;
    _title.text = model.setname;
    [_picImg sd_setImageWithURL:[NSURL URLWithString:model.scover] placeholderImage:[UIImage imageNamed:@"cell_bg_noData"]];
    _count.text = [NSString stringWithFormat:@"%@浏览",model.replynum];
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self drawCell];
    }
    return self;
    
}
- (void)drawCell {
    _picImg = [[UIImageView alloc]init];
    [self.contentView addSubview:_picImg];
    [_picImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-30);
        make.top.mas_equalTo(5);
    }];
    _title = [[UILabel alloc]init];
    _title.font = [UIFont systemFontOfSize:14.f];
    _title.numberOfLines = 1;
    _title.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_title];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(_picImg);
        make.width.mas_equalTo(200);
        make.top.mas_equalTo(_picImg.mas_bottom).offset(5);
    }];
    _count = [[UILabel alloc]init];
    _count.textColor = [UIColor lightGrayColor];
    _count.font = [UIFont systemFontOfSize:12.f];
    _count.numberOfLines = 1;
    _count.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_count];
    [_count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.bottomMargin.mas_equalTo(_title);
        make.rightMargin.mas_equalTo(_picImg);
    }];
    
    
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
