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
    
    [self testSet];
    // [self testArray];
    // [self testDictionary];
}

- (void)testSet {
    
    LockSet *set = [LockSet set];
    for (int i = 0; i < 5; i++) {
        [set addObject:@(i)];
    }
    NSArray *allObjects = [set allObjects];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"%@", [NSThread currentThread]);
        [set enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            NSLog(@"object = %@", obj);
        }];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        NSLog(@"%@", [NSThread currentThread]);
        for (int i = 0; i < allObjects.count; i++) {
            id obj = allObjects[i];
            [set removeObject:obj];
            NSLog(@"removeObj : %@", obj);
        }
    });
}

- (void)testArray {
    
    LockArray *arr = [LockArray array];
    for (int i = 0; i < 3; i++) {
        [arr addObject:@(i)];
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"%@", [NSThread currentThread]);
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"idx = %lu, value = %@", (unsigned long)idx, obj);
            if (idx == 1) {
                *stop = YES;
            }
        }];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"%@", [NSThread currentThread]);
        for (int i = 0; i < 3; i++) {
            [arr removeLastObject];
            NSLog(@"removeLastObject");
        }
    });
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
    
    LockDictionary *dic2 = [LockDictionary dictionary];
    for (int i = 0; i < 5; i++) {
        [dic2 setObject:@(i) forKey:@(i)];
    }
    NSArray *allKeys = [dic2 allKeys];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"%@", [NSThread currentThread]);
        [dic2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"key = %@, value = %@", key, obj);
        }];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        NSLog(@"%@", [NSThread currentThread]);
        for (int i = 0; i < allKeys.count; i++) {
            id key = [allKeys objectAtIndex:i];
            [dic2 removeObjectForKey:key];
            NSLog(@"removeKey : %@", key);
        }
    });
}

@end
