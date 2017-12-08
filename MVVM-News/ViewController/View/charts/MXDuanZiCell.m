//
//  MXDuanZiCell.m
//  MVVM-News
//
//  Created by 未思语 on 01/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//  自定义cell

#import "MXDuanZiCell.h"
@interface MXDuanZiCell()
{
    UILabel *_content;
    UIButton *_likeBtn;
    UILabel *_likeCount;
    UILabel *_date;
    
}
@end

@implementation MXDuanZiCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self drawView];
    }
    return self;
}
- (void)drawView {
    _content = [[UILabel alloc]init];
    _content.textColor = [UIColor blackColor];
    _content.font = [UIFont systemFontOfSize:16.f];
    _content.numberOfLines = 0;
    [self.contentView addSubview:_content];
    
//    _likeImg = [[UIImageView alloc]init];
//    UIImage *image = [UIImage imageNamed:@"zan"];
//    _likeImg.image = image;
//    [self.contentView addSubview:_likeImg];
    _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_likeBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
    [_likeBtn setImageEdgeInsets:UIEdgeInsetsMake(3, 3, 2, 5)];
    [_likeBtn addTarget:self action:@selector(like:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_likeBtn];
    
    
   
    _likeCount = [[UILabel alloc]init];
    _likeCount.textColor = [UIColor lightGrayColor];
    _likeCount.numberOfLines = 1;
    _likeCount.textAlignment = NSTextAlignmentLeft;
    _likeCount.font = [UIFont systemFontOfSize:12.f];
    [self.contentView addSubview:_likeCount];
    
    _date = [[UILabel alloc]init];
    _date.textColor = [UIColor lightGrayColor];
    _date.font = [UIFont systemFontOfSize:12.f];
    _date.numberOfLines = 1;
    _date.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_date];
    [self relayout];
    
}
- (void)like:(UIButton *)sender {
    
}

-(void)setModel:(MXDuanZiModel *)model{
    if (_model != model) {
        _model = model;
    }
    _content.text = model.text;
    _likeCount.text = [NSString stringWithFormat:@"%ld",model.zan];
    _date.text = model.created_at;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)relayout {
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    UIImage *image = [UIImage imageNamed:@"zan"];
//    [_likeImg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leftMargin.mas_equalTo(_content);
//        make.top.mas_equalTo(_content.mas_bottom);
//        make.width.mas_equalTo(image.size.width);
//    }];
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(_content);
        make.top.mas_equalTo(_content.mas_bottom);
        make.width.mas_equalTo(20);
    }];
    
    [_likeCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.bottomMargin.mas_equalTo(_likeBtn);
        make.width.mas_equalTo(@50);
        make.left.mas_equalTo(_likeBtn.mas_right);
    }];
    [_date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.topMargin.mas_equalTo(_likeBtn);
        make.left.mas_equalTo(_likeCount.mas_right);
        make.bottomMargin.mas_equalTo(_likeBtn);
        make.bottom.equalTo(self.contentView).offset(-5);
    }];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
