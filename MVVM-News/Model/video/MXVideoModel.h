//
//  MXVideoModel.h
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXBaseModel.h"
@class MXVideoListModel,MXVideoTopicModel,MXVideoSidListModel;

@interface MXVideoModel : MXBaseModel
@property (nonatomic, strong) NSArray <MXVideoListModel *>*videoList;
@property (nonatomic, strong) NSArray <MXVideoSidListModel *>*videoSidList;
@property (nonatomic, copy) NSString *videoHomeSid;

@end
@interface MXVideoListModel:MXBaseModel
@property (nonatomic, assign) NSInteger sizeHD;
@property (nonatomic, strong) MXVideoTopicModel *videoTopic;
@property (nonatomic, copy) NSString *mp4Hd_url;
@property (nonatomic, copy) NSString *description1;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *mp4_url;
@property (nonatomic, copy) NSString *vid;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, assign) NSInteger sizeSHD;
@property (nonatomic, assign) NSInteger playersize;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSString *m3u8_url;
@property (nonatomic, copy) NSString *topicImg;
@property (nonatomic, assign) NSInteger votecount;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, copy) NSString *videosource;
@property (nonatomic, copy) NSString *m3u8Hd_url;
@property (nonatomic, assign) NSInteger sizeSD;
@property (nonatomic, copy) NSString *topicSid;
@property (nonatomic, assign) NSInteger playCount;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, copy) NSString *replyBoard;
@property (nonatomic, copy) NSString *replyid;
@property (nonatomic, copy) NSString *topicName;
@property (nonatomic, copy) NSString *sectiontitle;
@property (nonatomic, copy) NSString *topicDesc;
@end
@interface MXVideoTopicModel:MXBaseModel
@property (nonatomic, copy) NSString *ename;
@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *topic_icons;
@property (nonatomic, copy) NSString *tid;
@end
@interface MXVideoSidListModel:MXBaseModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSString *sid;
@end



