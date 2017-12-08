//
//  MXNewsNetManager.h
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseNetManager.h"


//枚举
typedef NS_ENUM(NSInteger,MXNewsInfoType) {
    MXNewsInfoZuiXin = 0,
    MXNewsInfoXinWen,
    MXNewsInfoPingCe,
    MXNewsInfoDaoGou,
    MXNewsInfoYongChe,
    MXNewsInfoJiShu,
    MXNewsInfoWenHua,
    MXNewsInfoGaiZhuang,
    MXNewsInfoYouJi,
};

@interface MXNewsNetManager : MXBaseNetManager
- (void)getDataFromNetWithType:(MXNewsInfoType)type page:(NSInteger)page lastTime:(NSString *)lastTime completionHandler:(completionHandler)completionHandler;

@end
