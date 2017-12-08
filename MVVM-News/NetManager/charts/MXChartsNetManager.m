
//
//  MXChartsNetManager.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXChartsNetManager.h"

@implementation MXChartsNetManager
- (void)getDataWithSetID:(NSInteger)setID completionHandler:(completionHandler)completionHandler {
    NSString *path = [NSString stringWithFormat:@"http://c.3g.163.com/photo/api/morelist/0096/4GJ60096/%ld.json", setID];
    [self get:path parameters:nil completionHandler:completionHandler];
}
@end
