//
//  MXChartsViewModel.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXChartsViewModel.h"

@implementation MXChartsViewModel
-(void)refreshDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    self.setID = 82259;
    [self getDataFromNetWithCompletionHandler:completionHandler];
   
}
-(void)loadMoreDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    MXChartsModel *model = [self.dataArray lastObject];
    self.setID = model.setid.integerValue;
    [self getDataFromNetWithCompletionHandler:completionHandler];
}
-(void)getDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    MXChartsNetManager *manager = [[MXChartsNetManager alloc]init];
    [manager getDataWithSetID:self.setID completionHandler:^(id responseObject, NSError *error) {
        if (responseObject && !error) {
            if (self.setID == 82259) {
                [self.dataArray removeAllObjects];
            }
            [self.dataArray addObjectsFromArray:[MXChartsModel mj_objectArrayWithKeyValuesArray:responseObject]];
            
        }
        completionHandler(error);
    }];
    
}
@end

