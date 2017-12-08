//
//  MXBaseNetManager.h
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import <Foundation/Foundation.h>
//定义一个block

typedef void(^completionHandler)(id responseObject,NSError *error);

@interface MXBaseNetManager : NSObject

- (void)get:(NSString *)url parameters:(NSDictionary *)parameters completionHandler:(completionHandler)completionHandler;
- (void)post:(NSString *)url parameters:(NSDictionary *)parameters completionHandler:(completionHandler)completionHandler;



@end
