//
//  MXNewsModel.h
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseModel.h"
@class MXNewsModel,MXResultModel,MXNewsListModel,MXFocusimgModel,MXHeadlineinfoModel,MXTopnewsInfoModel;

@interface MXNewsModel : MXBaseModel
@property (nonatomic, strong) MXResultModel *result;
@property (nonatomic, assign) NSInteger returncode;
@property (nonatomic, copy) NSString *message;

@end

@interface MXResultModel :MXBaseModel
@property (nonatomic, assign) BOOL isloadmore;
@property (nonatomic, strong) NSArray <MXNewsListModel *>*newslist;
@property (nonatomic, assign) NSInteger rowcount;
@property (nonatomic, strong) NSArray <MXFocusimgModel *>* focusimg;
@property (nonatomic, strong) MXHeadlineinfoModel *headlineinfo;
@property (nonatomic, strong) MXTopnewsInfoModel *topnewsinfo;
@end

@interface MXFocusimgModel : MXBaseModel //每一个页面上轮播图的数据
@property (nonatomic, assign) NSInteger JumpType;
@property (nonatomic, assign) NSInteger fromtype;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *imgurl;
@property (nonatomic, copy) NSString *jumpurl;
@property (nonatomic, assign) NSInteger mediatype;
@property (nonatomic, assign) NSInteger pageindex;
@property (nonatomic, assign) NSInteger replycount;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, assign) NSInteger updatetime;

@end
@interface MXHeadlineinfoModel:MXBaseModel
@property (nonatomic, strong) NSArray *coverimages;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *indexdetail;
@property (nonatomic, assign) NSInteger jumppage;
@property (nonatomic, copy) NSString *lasttime;
@property (nonatomic, assign) NSInteger mediatype;
@property (nonatomic, assign) NSInteger pagecount;
@property (nonatomic, assign) NSInteger replycount;
@property (nonatomic, copy) NSString *smallpic;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;
@end
@interface MXNewsListModel:MXBaseModel//显示新闻列表的数据
@property (nonatomic, strong) NSArray *coverimages;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *indexdetail;
@property (nonatomic, assign) NSInteger jumppage;
@property (nonatomic, copy) NSString *lasttime;
@property (nonatomic, assign) NSInteger mediatype;
@property (nonatomic, assign) NSInteger newstype;
@property (nonatomic, assign) NSInteger pagecount;
@property (nonatomic, assign) NSInteger replycount;
@property (nonatomic, copy) NSString *smallpic;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, assign) NSInteger updatetime;
@end
@interface MXTopnewsInfoModel:MXBaseModel
@end


