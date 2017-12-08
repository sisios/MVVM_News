//
//  MXNewsViewController.m
//  MVVM-News
//
//  Created by 未思语 on 30/11/2017.
//  Copyright © 2017 wsy. All rights reserved.
//

#import "MXNewsViewController.h"

@interface MXNewsViewController ()


@end

@implementation MXNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"refresh" style:UIBarButtonItemStyleDone target:self action:@selector(refresh)];
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.f],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // Do any additional setup after loading the view.
}
- (void)refresh {
    NSLog(@"!!!refresh");
}
-(instancetype)init {
    self = [super initWithViewControllerClasses:[self addChildController] andTheirTitles:[self titleArr]];
    if (self) {
        self.keys = [self mxkeys];
        self.values = [self mxvalues];
    }
    return self;
    
}
//返回标题数组
-(NSArray *)titleArr {
   return @[@"最新",@"新闻",@"评测",@"导购",@"用车",@"技术",@"文化",@"改装",@"游记"];
}
// 返回detailvc的数组
- (NSArray *)addChildController {
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (int i = 0; i < [self titleArr].count; i ++) {
        [tmpArr addObject:[MXListViewController class]];
    }
    return [tmpArr copy];
}
- (NSMutableArray *)mxkeys {
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (int i = 0; i < [self titleArr].count; i ++) {
        [tmpArr addObject:@"infoType"];
    }
    return [tmpArr mutableCopy];
}
- (NSMutableArray *)mxvalues {
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (int i = 0; i < [self titleArr].count; i ++) {
        [tmpArr addObject:@(i)];
    }
    return [tmpArr mutableCopy];
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
