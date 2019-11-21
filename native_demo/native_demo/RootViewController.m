//
//  RootViewController.m
//  native_demo
//
//  Created by mannyhuang on 2019/11/21.
//  Copyright © 2019 manny. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * clickBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    [clickBtn setTitle:@"Flutter 跳转" forState:UIControlStateNormal];
    clickBtn.backgroundColor = [UIColor brownColor];
    [clickBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [clickBtn addTarget:self action:@selector(goFlutter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) goFlutter{
//    FlutterViewController *flutterVC = [[FlutterViewController alloc]init];
//    flutterVC.title = @"flutter 界面";
//    [self.navigationController pushViewController:flutterVC animated:YES];
    NSLog(@"btn click");
}

@end
