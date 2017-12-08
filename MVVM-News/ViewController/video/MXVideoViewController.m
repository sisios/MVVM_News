//
//  MXVideoViewController.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXVideoViewController.h"

@interface MXVideoViewController ()
@property (nonatomic, strong) MXVideoTableView *info;
@property (nonatomic, strong) MXVideoViewModel *viewModel;
@end

@implementation MXVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.info.mj_header beginRefreshing];
    self.title = @"视频";
    
    // Do any additional setup after loading the view.
}
-(MXVideoTableView *)info {
    if (!_info) {
        _info = [[MXVideoTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _info.tableFooterView = [UIView new];
        [self.view addSubview:_info];
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
- (MXVideoViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MXVideoViewModel alloc]init];
        
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
