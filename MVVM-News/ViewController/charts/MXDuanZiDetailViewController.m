//
//  MXDuanZiDetailViewController.m
//  MVVM-News
//
//  Created by 未思语 on 06/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXDuanZiDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVSpeechSynthesis.h>


@interface MXDuanZiDetailViewController ()<AVSpeechSynthesizerDelegate>
@property (nonatomic, strong) UIBarButtonItem *read;
@property (nonatomic, strong) UITextView *textview;
@property (nonatomic, strong) UIButton *share;
@property (nonatomic, strong) AVSpeechSynthesizer *speech;



@end

@implementation MXDuanZiDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view .backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textview];
    _share = [UIButton buttonWithType:UIButtonTypeCustom];
    _share.frame = CGRectMake(100, 270, 15, 30);
    [_share setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [_share addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_share];
    [self setNavigation];
    self.navigationItem.rightBarButtonItem = self.read;
    
    // Do any additional setup after loading the view.
}
-(void)setNavigation {
    self.title = @"详情";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    spaceItem.width = -16;
    self.navigationItem.leftBarButtonItems = @[spaceItem,backItem];
}
-(void)back:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(AVSpeechSynthesizer *)speech {
    if (!_speech) {
        _speech = [[AVSpeechSynthesizer alloc]init];
        _speech.delegate = self;
        
    }
    return _speech;
}
-(UIBarButtonItem *)read {
    if (!_read) {
        _read = [[UIBarButtonItem alloc]initWithTitle:@"阅读" style:UIBarButtonItemStylePlain target:self action:@selector(read:)];
        
    }
    return _read;
}
-(UITextView *)textview {
    if (!_textview) {
        _textview = [[UITextView alloc]initWithFrame:CGRectMake(10, 100, appWidth-20, 100)];
        _textview.backgroundColor = [UIColor whiteColor];
        _textview.font = [UIFont systemFontOfSize:13.f];
        _textview.textColor = [UIColor blackColor];
        _textview.textAlignment = NSTextAlignmentLeft;
        _textview.editable = NO;
        _textview.selectedRange = NSMakeRange(10, 5);//光标所在地
        [self.view addSubview:_textview];
    }
    return _textview;
}
-(void)setModel:(MXDuanZiModel *)model {
    _model = model;
    self.textview.text = model.text;
    
}
-(void)read:(UIBarButtonItem *)sender {
    if ([self.speech isSpeaking]) {
        [self.speech stopSpeakingAtBoundary:AVSpeechBoundaryWord];
        return;
    }
    AVSpeechUtterance *a = [[AVSpeechUtterance alloc]initWithString:self.model.text];
    a.rate = 0.5;
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice  voiceWithLanguage:@"zh-CN"];
    a.voice = voice;
    [_speech speakUtterance:a];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.speech isSpeaking]) {
        [self.speech stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    }
}

-(void)share:(UIButton *)sender {
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"开始阅读");
    self.read.title = @"暂停";
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"完成读文本");
    self.read.title = @"阅读";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"暂停播放");
    self.read.title = @"继续";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"继续播放");
    self.read.title = @"暂停";
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"取消播放");
    self.read.title = @"继续";
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {
    NSLog(@"返回来的range%lu,%lu",(unsigned long)characterRange.length,(unsigned long)characterRange.location);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
