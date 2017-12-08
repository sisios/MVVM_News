//
//  MXBaseModel.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseModel.h"

@implementation MXBaseModel
+(id)initWithDic:(NSDictionary *)dictionary {
    if (!dictionary || dictionary.count == 0) {
        return nil;
    }
    NSArray *allkeys = [dictionary allKeys];
    for (int i = 0; i < allkeys.count; i ++) {
        NSString *key = allkeys[i];
        [self setValue:[dictionary objectForKey:key] forKey:key];
    }
    return self;
}
+(NSArray *)initWithArr:(NSArray *)array {
    if (!array || ![array class] || array.count ==0) {
        return nil;
    }
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (int i = 0; i < array.count; i ++) {
        id dic = array[i];
        if([dic isKindOfClass:[NSDictionary class]]){
           id model = [self initWithDic:dic];
            [tmpArr addObject:model];
        }
    }
    return [tmpArr copy];
}
@end
