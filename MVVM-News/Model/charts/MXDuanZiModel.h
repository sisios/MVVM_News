//
//  MXDuanZiModel.h
//  MVVM-News
//
//  Created by 未思语 on 04/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseModel.h"

@interface MXDuanZiModel : MXBaseModel
@property (nonatomic, copy) NSString *screen_name;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString *original;
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *height;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, assign) NSInteger reposts;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger zan;

@end
