//
//  MXDuanZiView.m
//  MVVM-News
//
//  Created by 未思语 on 02/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXDuanZiView.h"
@interface MXDuanZiView()
@property (nonatomic, strong) MXDuanZiTableView *info;
@property (nonatomic, strong) MXDuanZiViewModel *viewModel;
@end

@implementation MXDuanZiView
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.info.mj_header beginRefreshing];
    }
    return self;
    
}
-(MXDuanZiTableView *)info {
    if (!_info) {
        _info = [[MXDuanZiTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _info.tableFooterView = [UIView new];
        [self addSubview:_info];
        [_info mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _info.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self refreshData];
        }];
        _info.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self reloadMore];
        }];
        
    }
    return _info;
    
}
- (MXDuanZiViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MXDuanZiViewModel alloc]init];
        
    }
    return _viewModel;
    
}
- (void)reloadMore {
    [self.viewModel loadMoreDataFromNetWithCompletionHandler:^( NSError *error) {
        if (!error) {
             self.info.dataArray = self.viewModel.dataArray;
        }
       
        if ([self.info.mj_footer isRefreshing]) {
            [self.info.mj_footer endRefreshing];
        }
    }];
}
- (void)refreshData {
    [self.viewModel refreshDataFromNetWithCompletionHandler:^(NSError *error) {
        if (!error) {
            self.info.dataArray = self.viewModel.dataArray;
        }
        if ([self.info.mj_header isRefreshing]) {
            [self.info.mj_header endRefreshing];
        }
    }];
}


@end
