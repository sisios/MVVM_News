//
//  MXChartsNetManager.h
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseNetManager.h"

@interface MXChartsNetManager : MXBaseNetManager

- (void)getDataWithSetID:(NSInteger)setID completionHandler:(completionHandler)completionHandler;

@end
