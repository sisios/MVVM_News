//
//  MXDetailViewController.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//  管理一个web页

#import "MXDetailViewController.h"
#import <WebKit/WebKit.h>
#import <objc/runtime.h>


@interface MXDetailViewController ()<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic, strong) WKWebView *webview;
@property (nonatomic, strong) UIProgressView *progress;

@end

@implementation MXDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation];
    
    
    NSString *path = [NSString stringWithFormat:@"http://www.baidu.com"];
     [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
    
    // Do any additional setup after loading the view.
}

-(void)setNavigation {
    self.title = @"新闻详情";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    spaceItem.width = -16;
    self.navigationItem.leftBarButtonItems = @[spaceItem,backItem];
}
- (void)back:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIProgressView *)progress {
    if (!_progress) {
        _progress = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 64, appWidth, 2)];
        _progress.progressTintColor = [UIColor blueColor];
        _progress.tintColor = [UIColor redColor];
        _progress.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
        [self.view addSubview:_progress];
    }
    return _progress;
}
-(WKWebView *)webview {
    if (!_webview) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
        configuration.preferences = [[WKPreferences alloc]init];
        configuration.userContentController = [[WKUserContentController alloc]init];
        _webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, appWidth, appHeight) configuration:configuration];
        _webview.navigationDelegate = self;
        _webview.UIDelegate = self;
        _webview.allowsBackForwardNavigationGestures = YES;
        //给webview添加kvo监听属性
        [_webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        [self.view addSubview:_webview];
    }
    return _webview;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progress.progress = [[change objectForKey:@"new"] floatValue];
         NSLog(@"加载过程中的float%lf",[change[@"new"] floatValue]);
        if (self.progress.progress == 1) {
            //一般在进度条到达1的时候都要进行延迟(2种方式的延时)
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                self.progress.hidden = YES;
//            });
            [UIView animateWithDuration:0.25 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.progress.transform = CGAffineTransformMakeScale(1.0, 1.4f);
            } completion:^(BOOL finished) {
                self.progress.hidden = YES;
            }];
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//开始
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    webView.hidden = NO;
    self.progress.hidden = NO;
    if ([self.webview.URL.scheme isEqual:@"about"]) {//避免加载一个空白页
        webView.hidden = YES;
        
    }
    [self.view bringSubviewToFront:self.progress];
}
-(void)webView:(WKWebView *)webView commitPreviewingViewController:(UIViewController *)previewingViewController {
    
}

//结束
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
//    [webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable title, NSError * _Nullable error) {
//        self.navigationItem.title = title;
//    }];
    self.progress.hidden = YES;
    
    
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    webView.hidden = YES;
}
- (void)webViewDidClose:(WKWebView *)webView {
    
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
