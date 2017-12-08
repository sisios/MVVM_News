//
//  MXNewsViewModel.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXNewsViewModel.h"
@interface MXNewsViewModel ()
{
    NSInteger infoType;
}
@end

@implementation MXNewsViewModel
-(instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
    
}
- (instancetype)initWithType:(NSInteger)type {
    self = [super init];
    if (self) {
        infoType = type;
    }
    return self;
}
-(void)refreshDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    self.page = 1;
    self.lastTime = @"0";
    [self getDataFromNetWithCompletionHandler:completionHandler];
    
    
    
}
-(void)loadMoreDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    self.page += 1;
    MXNewsListModel *model = [self.dataArray lastObject];
    self.lastTime = model.lasttime;
    [self getDataFromNetWithCompletionHandler:completionHandler];
    
}
-(void)getDataFromNetWithCompletionHandler:(completionBlock)completionHandler {
    MXNewsNetManager *manager = [[MXNewsNetManager alloc]init];
    [manager getDataFromNetWithType:infoType page:self.page lastTime:self.lastTime completionHandler:^(id responseObject, NSError *error) {
        if (responseObject && !error) {
            MXNewsModel *model = [MXNewsModel mj_objectWithKeyValues:responseObject];
            if (self.page == 1) {//下拉刷新
                [self.dataArray removeAllObjects];
                [self.topDataArray removeAllObjects];
            }
            [self.dataArray addObjectsFromArray: model.result.newslist];
            [self.topDataArray addObjectsFromArray:[self updateTopViewDataWithArr: model.result.focusimg]];
            
        }
        completionHandler(error);
    }];
    
    
}
- (NSMutableArray *)updateTopViewDataWithArr:(NSArray *)arr {
    NSMutableArray *tmpUrls = [NSMutableArray array];
    for (MXFocusimgModel *model in arr) {
        [tmpUrls addObject:model.imgurl];
    }
    return [tmpUrls mutableCopy];
}
@end
