//
//  MXTabBarController.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXTabBarController.h"

@interface MXTabBarController ()

@end

@implementation MXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:[[MXNewsViewController alloc]init] image:[UIImage imageNamed:@"news"] selectImage:[UIImage imageNamed:@"newsblue"] title:@"新闻"];
    [self addChildViewController:[[MXChartsViewController alloc]init] image:[UIImage imageNamed:@"live"] selectImage:[UIImage imageNamed:@"liveblue"] title:@"图文"];
    [self addChildViewController:[[MXVideoViewController alloc]init] image:[UIImage imageNamed:@"market"] selectImage:[UIImage imageNamed:@"marketblue"] title:@"视频"];
    [self addChildViewController:[[MXMineViewController alloc]init] image:[UIImage imageNamed:@"my"] selectImage:[UIImage imageNamed:@"myblue"] title:@"我"];
    
    // Do any additional setup after loading the view.
}
- (void)addChildViewController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectedImage title:(NSString *)title {
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    vc.tabBarItem.title = title;
    MXNavigationController *navc = [[MXNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:navc];
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
