//
//  ViewController.m
//  YCStatusHUD
//
//  Created by yaochao on 15/1/26.
//  Copyright (c) 2015年 YC. All rights reserved.
//

#import "ViewController.h"
#import "YCStatusHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)successClick:(id)sender {
    [YCStatusHUD showSuccessWith:@"加载成功"];
}

- (IBAction)failClick:(id)sender {
    [YCStatusHUD showFailWith:@"加载失败"];
}

- (IBAction)loadingClick:(id)sender {
    [YCStatusHUD showLoadingWith:@"正在加载"];
}
- (IBAction)cancelLoadingClick:(id)sender {
    [YCStatusHUD cancelLoading];
}

@end
