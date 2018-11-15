//
//  ViewController.m
//  huaxian
//
//  Created by zhanghongfu on 17/2/22.
//  Copyright © 2017年 zhanghongfu. All rights reserved.
//

#import "ViewController.h"
#import "linesView.h"

#import "boxView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
//    linesView * lin  = [[linesView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    
//    lin.backgroundColor = [UIColor whiteColor];
//    
//    [self.view addSubview:lin];
    
    

    
    boxView * box = [[boxView alloc]  initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 300)];
    box.backgroundColor = [UIColor blackColor];
    [self.view addSubview:box];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
