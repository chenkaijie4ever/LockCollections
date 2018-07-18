//
//  ViewController.m
//  LockCollectionsDemo
//
//  Created by chenkaijie on 2018/7/18.
//  Copyright © 2018年 ckj. All rights reserved.
//

#import "ViewController.h"
#import "LockCollections.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self testDictionary];
}

- (void)testDictionary {
    
    LockDictionary *dic = [LockDictionary dictionary];
    
    [dic setObject:@(0) forKey:@"intvalue"];
    NSLog(@"%d", [dic intValueForKey:@"intvalue" defaultValue:1]);
    NSLog(@"%d", [dic intValueForKey:@"intvalue2" defaultValue:1]);
    
    [dic setObject:@(0.f) forKey:@"floatvalue"];
    NSLog(@"%f", [dic floatValueForKey:@"floatvalue" defaultValue:1.f]);
    NSLog(@"%f", [dic floatValueForKey:@"floatvalue2" defaultValue:1]);
    
    [dic setObject:@(YES) forKey:@"boolvalue"];
    NSLog(@"%d", [dic boolValueForKey:@"boolvalue"]);
    NSLog(@"%d", [dic boolValueForKey:@"boolvalue2"]);
    
    [dic setObject:@"HelloWorld" forKey:@"stringValue"];
    NSLog(@"%@", [dic stringValueForKey:@"stringValue"]);
    NSLog(@"%@", [dic stringValueForKey:@"stringValue2"]);
}

@end
