//
//  ViewController.m
//  ZRHUDExample
//
//  Created by etcxm on 16/7/22.
//  Copyright © 2016年 中软国际. All rights reserved.
//

#import "ViewController.h"
#import "ZRHUD.h"

@interface ViewController ()
- (IBAction)theClickAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)theClickAction:(id)sender {
    
    [ZRHUD SuccessSuggestion:@"加载成功！！！"];
}
@end
