//
//  MXNewsViewModel.h
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseViewModel.h"

@interface MXNewsViewModel : MXBaseViewModel
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSString *lastTime;

- (instancetype)initWithType:(NSInteger)type;


@end
