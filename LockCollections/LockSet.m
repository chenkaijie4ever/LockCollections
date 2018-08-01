//
//  LockSet.m
//  LockCollections
//
//  Created by chenkaijie on 2018/7/18.
//  Copyright © 2018年 ckj. All rights reserved.
//

#import "LockSet.h"

@interface LockSet () {
    
    NSRecursiveLock *_lock;
    NSMutableSet *_set;
}

@end

@implementation LockSet

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _lock = [NSRecursiveLock new];
        _set = [NSMutableSet setWithCapacity:1];
    }
    return self;
}

- (instancetype)initWithMutableSet:(NSMutableSet *)set {
    
    self = [self init];
    if (self) {
        if (set) {
            [_set setSet:set];
        }
    }
    return self;
}

+ (instancetype)set {
    
    return [self setWithMutableSet:nil];
}

+ (instancetype)setWithMutableSet:(NSMutableSet *)set {
    
    LockSet *lockSet = [[LockSet alloc] initWithMutableSet:set];
    return lockSet;
}

- (void)addObject:(id)anObject {
    
    if (anObject == nil) {
        return;
    }
    
    [_lock lock];
    [_set addObject:anObject];
    [_lock unlock];
}

- (void)removeObject:(id)anObject {
    
    if (anObject == nil) {
        return;
    }
    
    [_lock lock];
    [_set removeObject:anObject];
    [_lock unlock];
}

- (BOOL)containsObject:(id)anObject {
    
    [_lock lock];
    BOOL r = [_set containsObject:anObject];
    [_lock unlock];
    
    return r;
}

- (NSArray *)allObjects {
    
    [_lock lock];
    NSArray *objects = [_set allObjects];
    [_lock unlock];
    
    return objects;
}

- (void)removeAllObjects {
    
    [_lock lock];
    [_set removeAllObjects];
    [_lock unlock];
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    if (key == nil) {
        return;
    }
    
    [_lock lock];
    [_set setValue:value forKey:key];
    [_lock unlock];
}

- (id)valueForKey:(NSString *)key {
    
    if (key == nil) {
        return nil;
    }
    
    [_lock lock];
    id obj = [_set valueForKey:key];
    [_lock unlock];
    
    return obj;
}

- (void)setSet:(NSSet *)set {
    
    [_lock lock];
    _set = [[NSMutableSet alloc] initWithSet:set];
    [_lock unlock];
}

- (void)addObjectsFromArray:(NSArray *)otherArray {
    
    if (!otherArray) {
        return;
    }
    
    [_lock lock];
    [_set addObjectsFromArray:otherArray];
    [_lock unlock];
}

- (NSUInteger)count {
    
    [_lock lock];
    NSUInteger count = [_set count];
    [_lock unlock];
    
    return count;
}

- (NSSet *)fetchSet {
    
    [_lock lock];
    NSSet *set = [NSSet setWithSet:_set];
    [_lock unlock];
    
    return set;
}

- (void)enumerateObjectsUsingBlock:(void (^)(id obj, BOOL *stop))block {
    
    if (!block) return;
    [_lock lock];
    BOOL _stop = NO;
    for (id obj in _set) {
        block(obj, &_stop);
        if (_stop) break;
    }
    [_lock unlock];
}

@end
