//
//  MXVideoModel.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXVideoModel.h"

@implementation MXVideoModel
+(NSDictionary *)mj_objectClassInArray {
    return @{@"videoList":[MXVideoListModel class],
             @"videoSidList":[MXVideoSidListModel class]
             };
}

@end
@implementation MXVideoListModel
+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"description1":@"description"};
}
@end
@implementation MXVideoTopicModel

@end
@implementation MXVideoSidListModel

@end
