//
//  MXDuanZiTableView.m
//  MVVM-News
//
//  Created by 未思语 on 01/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//  自定义tableview

#import "MXDuanZiTableView.h"
@interface MXDuanZiTableView() <UITableViewDelegate,UITableViewDataSource>
@end

@implementation MXDuanZiTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        //tableview中用mansory动态布局cell的高度 1，不要使用代理方法 heightforrow 2，最后一个控件要跟cell.contentview 进行关联
        self.estimatedRowHeight = 200;//预估高度
        self.rowHeight = UITableViewAutomaticDimension;
        
    }
    return self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    MXDuanZiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[MXDuanZiCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor whiteColor];
        
    }
    MXDuanZiModel *item = self.dataArray[indexPath.row];
    cell.model = item;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MXDuanZiDetailViewController *vc = [[MXDuanZiDetailViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    MXDuanZiModel *item = self.dataArray[indexPath.row];
    vc.model = item;
    [self.viewcontroller.navigationController pushViewController:vc animated:YES];
    
}
-(void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (_dataArray.count > 0) {
        [self reloadData];
    }
}
@end
