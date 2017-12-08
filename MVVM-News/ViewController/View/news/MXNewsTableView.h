//
//  MXNewsTableView.h
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXNewsTableView : UITableView <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;// 存储从VM中请求回来并且解析的model数据，用于tabelview的刷新


@end
