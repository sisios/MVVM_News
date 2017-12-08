
//
//  MXDuanZiViewModel.m
//  MVVM-News
//
//  Created by 未思语 on 04/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXDuanZiViewModel.h"

@implementation MXDuanZiViewModel
-(void)getDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    MXDuanZiNetManager *manager = [[MXDuanZiNetManager alloc]init];
    [manager getDataWithPage:self.page completionHandler:^(id responseObject, NSError *error) {
        if (responseObject && !error) {
            if (self.page == 1) {//下拉加载
                [self.dataArray removeAllObjects];
            }
            [self.dataArray addObjectsFromArray:[MXDuanZiModel mj_objectArrayWithKeyValuesArray:responseObject]];
        }
        completionHandler(error);
    }];
    
}
-(void)loadMoreDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    self.page += 1;
    [self getDataFromNetWithCompletionHandler:completionHandler];
}
-(void)refreshDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    self.page = 1;
    //网络请求
    [self getDataFromNetWithCompletionHandler:completionHandler];
    
}
@end
