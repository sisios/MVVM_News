//
//  MXVideoNetManager.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXVideoNetManager.h"

@implementation MXVideoNetManager
- (void)getDataFromNetWithPage:(NSInteger)page completionHandler:(completionHandler)completionHandler {
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html", page];
    [self get:path parameters:nil completionHandler:completionHandler];
    
}

@end
