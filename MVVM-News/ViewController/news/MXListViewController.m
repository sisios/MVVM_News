//
//  MXListViewController.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXListViewController.h"

@interface MXListViewController ()<SDCycleScrollViewDelegate>
{
    NSInteger page;//页数
}
@property (nonatomic, strong) MXNewsTableView *info;
@property (nonatomic, strong) SDCycleScrollView *topView;//轮播图
@property (nonatomic, strong) MXNewsViewModel *viewModel;//每一种类型对应一种viewmodel


@end

@implementation MXListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

    [self.info.mj_header beginRefreshing];
   
    // Do any additional setup after loading the view.
}
//轮播图加载在tableview的tableheaderview
-(SDCycleScrollView *)topView {
    if (!_topView) {
        _topView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, appWidth, scrollViewHeight) delegate:self placeholderImage:[UIImage imageNamed:@"http://pic49.nipic.com/file/20140927/19617624_230415502002_2.jpg"]];
        _topView.autoScrollTimeInterval = 1.f;
        _topView.infiniteLoop = YES;
        _topView.autoScroll = YES;
        _topView.showPageControl = YES;
        _topView.currentPageDotColor = [UIColor whiteColor];
        _topView.pageDotColor = [UIColor blueColor];
        _topView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        
    }
    return _topView;
}

-(MXNewsTableView *)info {
    if (!_info) {
        _info = [[MXNewsTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _info.tableFooterView = [UIView new];
        [self.view addSubview:_info];
        [_info mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_offset(0);
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


// 下拉加载
- (void)refreshData {
    self.viewModel = [[MXNewsViewModel alloc]initWithType:[self.infoType integerValue]];
    [self.viewModel refreshDataFromNetWithCompletionHandler:^( NSError *error) {//到这层面就不把数据传回来了，刷新的数据取自viewmodel
        if (!error) {
            //进行UI刷新显示
            self.info.dataArray = [NSArray arrayWithArray:self.viewModel.dataArray];
            if (self.viewModel.topDataArray && self.viewModel.topDataArray.count > 0) {
                self.info.tableHeaderView = self.topView;
                self.topView.imageURLStringsGroup = self.viewModel.topDataArray;
            }
        }
        
        if ([self.info.mj_header isRefreshing]) {
            [self.info.mj_header endRefreshing];
        }
    }];
    
    
}
-(MXNewsViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MXNewsViewModel alloc]initWithType:self.infoType.integerValue];
    }
    return _viewModel;
}
//上拉加载更多
- (void)reloadMore {
//    self.viewModel = [[MXNewsViewModel alloc]initWithType:[self.infoType integerValue]];
    [self.viewModel loadMoreDataFromNetWithCompletionHandler:^( NSError *error) {
        //进行UI刷新显示
        if (!error) {
            self.info.dataArray = [NSArray arrayWithArray:self.viewModel.dataArray];
        }
        
        if ([self.info.mj_footer isRefreshing]) {
            [self.info.mj_footer endRefreshing];
        }
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark delegate
//选中图片的回调
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    MXDetailViewController *vc = [[MXDetailViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
//    NSLog(@"当前滚动的是%ld",index);
}

@end
