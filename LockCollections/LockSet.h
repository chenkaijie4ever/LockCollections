//
//  LockSet.h
//  LockCollections
//
//  Created by chenkaijie on 2018/7/18.
//  Copyright © 2018年 ckj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LockSet : NSObject

- (instancetype)initWithMutableSet:(NSMutableSet *)set;
+ (instancetype)set;
+ (instancetype)setWithMutableSet:(NSMutableSet *)set;

- (void)addObject:(id)anObject;
- (void)removeObject:(id)anObject;

- (BOOL)containsObject:(id)anObject;

- (NSArray *)allObjects;
- (void)removeAllObjects;

- (void)setValue:(id)value forKey:(NSString *)key;
- (id)valueForKey:(NSString *)key;

- (void)setSet:(NSSet *)set;
- (void)addObjectsFromArray:(NSArray *)otherArray;

- (NSUInteger)count;

- (NSSet *)fetchSet;
- (void)enumerateObjectsUsingBlock:(void (^)(id obj, BOOL *stop))block;

@end
