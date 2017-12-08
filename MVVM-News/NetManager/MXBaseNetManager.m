//
//  MXBaseNetManager.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseNetManager.h"

static AFHTTPSessionManager *manager = nil;
@interface MXBaseNetManager()
{
    NSURLSessionDataTask *task;
    
}

@end

@implementation MXBaseNetManager

+(AFHTTPSessionManager *)shareManager {
    //利用CDG——once来来创建单例
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @synchronized(manager){
            if(!manager){
                manager = [AFHTTPSessionManager manager];
                manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"text/plain",@"text/javascript",@"application/json", nil];
                
            }
        }
        
    });
    return manager;
    
}
- (void)get:(NSString *)url parameters:(NSDictionary *)parameters completionHandler:(completionHandler)completionHandler {
    task = [[MXBaseNetManager shareManager] GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil,error);
    }];
}
- (void)post:(NSString *)url parameters:(NSDictionary *)parameters completionHandler:(completionHandler)completionHandler{
    task = [[MXBaseNetManager shareManager] POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil,error);
    }];
}

@end
