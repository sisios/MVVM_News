//
//  MXVideoTableView.m
//  MVVM-News
//
//  Created by 未思语 on 04/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXVideoTableView.h"
#import <MediaPlayer/MPMoviePlayerController.h>
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVPlayerViewController.h>


@interface MXVideoTableView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) MXVideoTableView *info;
@property (nonatomic, strong) MXVideoViewModel *viewModel;
@property (nonatomic, strong) MPMoviePlayerController *vc;

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerViewController *vc1;




@end

@implementation MXVideoTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if(self){
        self.delegate = self;
        self.dataSource = self;
        // masonry 自动布局cell高度
        self.estimatedRowHeight = 200;
        self.rowHeight = UITableViewAutomaticDimension;
        
    }
    return self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    MXVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[MXVideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor whiteColor];
        
    }
    MXVideoListModel *item = self.dataArray[indexPath.row];
    cell.model = item;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MXVideoListModel *item = self.dataArray[indexPath.row];
    [self test:item];
    
}

- (void)test:(MXVideoListModel *)item {
    self.vc1 = [[AVPlayerViewController alloc]init];
    self.vc1.player = [AVPlayer playerWithURL:[NSURL URLWithString:item.mp4_url]];
    [self.viewcontroller presentViewController:self.vc1 animated:YES completion:nil];
   
}

-(void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (_dataArray.count > 0) {
        [self reloadData];
    }
}
@end
