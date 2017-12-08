//
//  MXVideoViewModel.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXVideoViewModel.h"

@implementation MXVideoViewModel
-(void)refreshDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    self.page = 1;
    [self getDataFromNetWithCompletionHandler:completionHandler];
}
-(void)loadMoreDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    self.page += 1;
    [self getDataFromNetWithCompletionHandler:completionHandler];
}
-(void)getDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    MXVideoNetManager *manager = [[MXVideoNetManager alloc]init];
    [manager getDataFromNetWithPage:self.page completionHandler:^(id responseObject, NSError *error) {
        if (responseObject && !error) {
            if (self.page == 1) {
                [self.dataArray removeAllObjects];
            }
            MXVideoModel *model = [MXVideoModel mj_objectWithKeyValues:responseObject];
            [self.dataArray addObjectsFromArray:model.videoList];
        }
        completionHandler(error);
        
    }];
    
}
@end

