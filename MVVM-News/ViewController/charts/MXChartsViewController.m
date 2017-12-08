//
//  MXChartsViewController.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXChartsViewController.h"

@interface MXChartsViewController ()
{
    MXDuanZiView *duanziView;// 文字
    MXChartsView *chartsView;//图片
    

}
@end

@implementation MXChartsViewController

- (void)viewDidLoad {
    UISegmentedControl *control = [[UISegmentedControl alloc]initWithItems:@[@"段子",@"图片"]];
    control.tintColor = [UIColor redColor];
    [control setWidth:100 forSegmentAtIndex:0];
    [control setWidth:100 forSegmentAtIndex:1];
    control.selectedSegmentIndex = 0;
    [control addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self change:control];
    self.navigationItem.titleView = control;
    
    // Do any additional setup after loading the view.
}
- (void)change:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            {
                if (chartsView) {
                    [chartsView removeFromSuperview];
                    chartsView = nil;
                }
                if (!duanziView) {
                    duanziView = [[MXDuanZiView alloc]initWithFrame:CGRectZero];
                    [self.view addSubview:duanziView];
                    [duanziView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.mas_equalTo(0);
                    }];
                }
                break;
            }
            
        case 1:
        {
            if (duanziView) {
                [duanziView removeFromSuperview];
                duanziView = nil;
            }
            if (!chartsView) {
                chartsView = [[MXChartsView alloc]initWithFrame:CGRectZero];
                [self.view addSubview:chartsView];
                [chartsView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(0);
                }];
                
            }
            break;
        }
        default:
            break;
    }
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
