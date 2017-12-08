//
//  MXBaseViewModel.h
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseModel.h"
typedef void(^completionBlock)(NSError * error);
//协议
@protocol MXBaseViewModelDelegate <NSObject>
// 获取数据
- (void)getDataFromNetWithCompletionHandler:(completionBlock)completionHandler;
//加载更多
- (void)loadMoreDataFromNetWithCompletionHandler:(completionBlock)completionHandler;
//下拉刷新
- (void)refreshDataFromNetWithCompletionHandler:(completionBlock)completionHandler;
@end

@interface MXBaseViewModel : NSObject <MXBaseViewModelDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;//新闻数据
@property (nonatomic, strong) NSMutableArray *topDataArray;//轮播图数据



@end
