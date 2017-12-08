//
//  MXChartsTableView.m
//  MVVM-News
//
//  Created by 未思语 on 02/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXChartsTableView.h"
@interface MXChartsTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MXChartsTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.estimatedRowHeight = 100;
    }
    return self;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    MXChartsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[MXChartsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor whiteColor];
        
    }
    MXChartsModel *item = self.dataArray[indexPath.row];
    cell.model = item;
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MXChartsDetailViewController *vc = [[MXChartsDetailViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.viewcontroller.navigationController pushViewController:vc animated:YES];
    
}

-(void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (_dataArray.count > 0) {
        [self reloadData];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
