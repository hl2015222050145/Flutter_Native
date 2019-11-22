//
//  RootViewController.m
//  native_demo
//
//  Created by mannyhuang on 2019/11/21.
//  Copyright © 2019 manny. All rights reserved.
//

#import "RootViewController.h"
#import "RegisterViewController.h"
@import Flutter;
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
    FlutterViewController *flutterViewController = [[FlutterViewController alloc]init];
    flutterViewController.title = @"flutter 界面";
    [flutterViewController setInitialRoute:@"login"];
    __weak __typeof(self) weakSelf = self;
    
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"flutter.demo/goToNativePage"
                                            binaryMessenger:flutterViewController];

    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
        // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
        // result 是给flutter的回调， 该回调只能使用一次
        NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
        RegisterViewController * registerVc = [RegisterViewController new];
        registerVc.title = @"注册";
        [weakSelf.navigationController pushViewController:registerVc animated:YES];
        
    }];
    
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

@end
