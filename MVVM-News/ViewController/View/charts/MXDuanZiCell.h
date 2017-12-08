//
//  MXDuanZiCell.h
//  MVVM-News
//
//  Created by 未思语 on 01/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXDuanZiModel.h"

@interface MXDuanZiCell : UITableViewCell
@property (nonatomic, strong) MXDuanZiModel *model;
+ (CGFloat)getCellHeightWithModel:(MXDuanZiModel *)model;

@end
