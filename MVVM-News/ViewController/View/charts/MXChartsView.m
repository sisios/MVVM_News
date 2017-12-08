//
//  MXChartsView.m
//  MVVM-News
//
//  Created by 未思语 on 02/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXChartsView.h"
@interface MXChartsView()
@property (nonatomic, strong) MXChartsTableView *info;
@property (nonatomic, strong) MXChartsViewModel *viewModel;

@end
@implementation MXChartsView
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self.info.mj_header beginRefreshing];
    }
    return self;
}
-(MXChartsTableView *)info {
    if (!_info) {
        _info = [[MXChartsTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
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
- (MXChartsViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MXChartsViewModel alloc]init];
        
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
