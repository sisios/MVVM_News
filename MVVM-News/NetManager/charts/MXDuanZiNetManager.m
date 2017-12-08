//
//  MXDuanZiNetManager.m
//  MVVM-News
//
//  Created by 未思语 on 04/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXDuanZiNetManager.h"

@implementation MXDuanZiNetManager
- (void)getDataWithPage:(NSInteger)page completionHandler:(completionHandler)completionHandler {
    NSString *path = [NSString stringWithFormat:@"http://joke.luckyamy.com/api/?cat=dz&p=%ld&ap=ymds&ver=1.6",page];
    [self get:path parameters:nil completionHandler:completionHandler];
    
}
@end
