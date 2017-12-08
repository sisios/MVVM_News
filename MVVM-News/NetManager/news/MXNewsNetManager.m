//
//  MXNewsNetManager.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXNewsNetManager.h"

@implementation MXNewsNetManager
- (void)getDataFromNetWithType:(MXNewsInfoType)type page:(NSInteger)page lastTime:(NSString *)lastTime completionHandler:(completionHandler)completionHandler {
    NSString *path = nil;
    switch (type) {
        case MXNewsInfoZuiXin:
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt0-p%ld-s30-l%@.json", page, lastTime];
            break;
        case MXNewsInfoXinWen:
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt1-p%ld-s30-l%@.json", page, lastTime];
            break;
        case MXNewsInfoPingCe:
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt3-p%ld-s30-l%@.json", page, lastTime];
            break;
        case MXNewsInfoDaoGou:
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt60-p%ld-s30-l%@.json", page, lastTime];
            break;
        case MXNewsInfoYongChe:
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt82-p%ld-s30-l%@.json", page, lastTime];
            break;
        case MXNewsInfoJiShu:
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt102-p%ld-s30-l%@.json", page, lastTime];
            break;
        case MXNewsInfoWenHua:
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt97-p%ld-s30-l%@.json", page, lastTime];
            break;
        case MXNewsInfoGaiZhuang:
            path = [NSString stringWithFormat: @"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt107-p%ld-s30-l%@.json", page, lastTime];
            break;
        case MXNewsInfoYouJi:
            path = [NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt100-p%ld-s30-l%@.json", page, lastTime];
            break;
        default:
            break;
    }
    NSLog(@" 上传的url ==== %@",path);
    [self get:path parameters:nil completionHandler:^(id responseObject, NSError *error) {
        completionHandler(responseObject,error);
    }];
  
}
@end
