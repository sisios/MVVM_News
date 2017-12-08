//
//  MXBaseViewModel.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseViewModel.h"

@implementation MXBaseViewModel
-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(NSMutableArray *)topDataArray {
    if (!_topDataArray) {
        _topDataArray = [NSMutableArray array];
    }
    return _topDataArray;
    
}
@end
