//
//  ViewController.m
//  JsonDicDemo
//
//  Created by ma shuang on 18/6/22.
//  Copyright © 2018年 zhuhaiyan. All rights reserved.
//

#import "ViewController.h"
#import "NSDictionary+ext.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *jsonDic = @{
                              @"b":@{
                                      @"dd":@"gfggs",
                                      @"asf":@"ds",
                                      @"f":@"gfggs",
                                      @"hgf":@(4),
                                      @"gd":@"gfggs",
                                      @"jsf":@"ds"
                                      },
                              @"cd":@"xsda",
                              @"esa":@(2),
                              @"ff":@"fsaf",
                              @"zz":@"ds",
                              @"gg":@"dd",
                              @"aa":@"sad"
                              };
    
    NSLog(@"%@",[jsonDic dictionaryToJsonBySort]);
    //NSDictionary *diccc = [NSJSONSerialization JSONObjectWithData:[[jsonDic dictionaryToJsonBySort] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    //NSLog(@"%@",diccc);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
