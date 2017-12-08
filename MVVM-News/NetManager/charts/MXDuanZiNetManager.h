//
//  MXDuanZiNetManager.h
//  MVVM-News
//
//  Created by 未思语 on 04/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseNetManager.h"

@interface MXDuanZiNetManager : MXBaseNetManager
- (void)getDataWithPage:(NSInteger)page completionHandler:(completionHandler)completionHandler;

@end
