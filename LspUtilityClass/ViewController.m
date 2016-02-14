//
//  ViewController.m
//  LspUtilityClass
//
//  Created by 大麦 on 15/12/1.
//  Copyright (c) 2015年 lsp. All rights reserved.
//

#import "ViewController.h"
#import "LspToolClass.h"
@interface ViewController ()

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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self methods];
}

-(void)methods
{
    UIFont *font = [UIFont systemFontOfSize:16.0];
    NSString *string = @"自啊这个那么整个文本将以每行组成的矩形为单位计算整个文本的尺寸你看那速度那速度啊速度拿手机看方便怒大部分阿萨德发多少发多少分";
    float width = 100;
    float height = 21;
    
    float getWidth = [LspToolClass getWidthWithHeight:height andfont:font andText:string];
    float getHeight = [LspToolClass getHeightWithWidth:width andfont:font andText:string];
    
    NSLog(@"getWidth=%f",getWidth);
    NSLog(@"getHeight=%f",getHeight);
}


@end
