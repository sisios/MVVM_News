//
//  MXChartsModel.h
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseModel.h"

@interface MXChartsModel : MXBaseModel
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *pvnum;
@property (nonatomic,copy) NSString *createdate;
@property (nonatomic,copy) NSString *scover;
@property (nonatomic,copy) NSString *setname;
@property (nonatomic,copy) NSString *cover;
@property (nonatomic,strong) NSArray *pics;
@property (nonatomic,copy) NSString *clientcover1;
@property (nonatomic,copy) NSString *replynum;
@property (nonatomic,copy) NSString *topicname;
@property (nonatomic,copy) NSString *setid;
@property (nonatomic,copy) NSString *seturl;
@property (nonatomic,copy) NSString *datetime;
@property (nonatomic,copy) NSString *clientcover;
@property (nonatomic,copy) NSString *imgsum;
@property (nonatomic,copy) NSString *tcover;
@end
