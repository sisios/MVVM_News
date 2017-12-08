//
//  MXNewsModel.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXNewsModel.h"

@implementation MXNewsModel
@end
@implementation MXFocusimgModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

@end
@implementation MXHeadlineinfoModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}
@end
@implementation MXNewsListModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}
@end
@implementation MXResultModel
+(NSDictionary *)mj_objectClassInArray {
    return @{@"newslist":[MXNewsListModel class],
             @"focusimg":[MXFocusimgModel class]
             };
    
}
@end
@implementation MXTopnewsInfoModel

@end
