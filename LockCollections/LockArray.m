//
//  LockArray.m
//  LockCollections
//
//  Created by chenkaijie on 2018/7/18.
//  Copyright © 2018年 ckj. All rights reserved.
//

#import "LockArray.h"

@interface LockArray () {
    
    NSRecursiveLock *_lock;
    NSMutableArray *_array;
}

@end

@implementation LockArray

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _lock = [NSRecursiveLock new];
        _array = [NSMutableArray arrayWithCapacity:1];
    }
    return self;
}

- (instancetype)initWithMutableArray:(NSMutableArray *)array {
    
    self = [self init];
    if (self) {
        if (array) {
            [_array setArray:array];
        }
    }
    return self;
}

+ (instancetype)array {
    
    return [self arrayWithMutableArray:nil];
}

+ (instancetype)arrayWithMutableArray:(NSMutableArray *)array {
    
    LockArray *lockArray = [[LockArray alloc] initWithMutableArray:array];
    return lockArray;
}

- (id)objectAtIndex:(NSUInteger)index {
    
    [_lock lock];
    id obj = [_array objectAtIndex:index];
    [_lock unlock];
    
    return obj;
}

- (void)addObject:(id)anObject {
    
    if (anObject == nil) {
        return;
    }
    
    [_lock lock];
    [_array addObject:anObject];
    [_lock unlock];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (anObject == nil) {
        return;
    }
    
    [_lock lock];
    [_array insertObject:anObject atIndex:index];
    [_lock unlock];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    
    if (anObject == nil) {
        return;
    }
    
    [_lock lock];
    [_array replaceObjectAtIndex:index withObject:anObject];
    [_lock unlock];
}

- (void)removeObject:(id)anObject {
    
    if (anObject == nil) {
        return;
    }
    
    [_lock lock];
    [_array removeObject:anObject];
    [_lock unlock];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    
    [_lock lock];
    [_array removeObjectAtIndex:index];
    [_lock unlock];
}

- (void)removeObjectsInArray:(NSArray *)otherArray {
    
    if (!otherArray) {
        return;
    }
    
    [_lock lock];
    [_array removeObjectsInArray:otherArray];
    [_lock unlock];
}

- (BOOL)containsObject:(id)anObject {
    
    [_lock lock];
    BOOL r = [_array containsObject:anObject];
    [_lock unlock];
    
    return r;
}

- (id)firstObject {
    
    [_lock lock];
    id obj = [_array firstObject];
    [_lock unlock];
    
    return obj;
}

- (id)lastObject {
    
    [_lock lock];
    id obj = [_array lastObject];
    [_lock unlock];
    
    return obj;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    if (key == nil) {
        return;
    }
    
    [_lock lock];
    [_array setValue:value forKey:key];
    [_lock unlock];
}

- (id)valueForKey:(NSString *)key {
    
    if (key == nil) {
        return nil;
    }
    
    [_lock lock];
    id obj = [_array valueForKey:key];
    [_lock unlock];
    
    return obj;
}

- (void)setArray:(NSArray *)array {
    
    [_lock lock];
    _array = [[NSMutableArray alloc] initWithArray:array];
    [_lock unlock];
}

- (void)addObjectsFromArray:(NSArray *)otherArray {
    
    if (!otherArray) {
        return;
    }
    
    [_lock lock];
    [_array addObjectsFromArray:otherArray];
    [_lock unlock];
}

- (void)removeLastObject {
    
    [_lock lock];
    [_array removeLastObject];
    [_lock unlock];
}

- (void)removeAllObjects {
    
    [_lock lock];
    [_array removeAllObjects];
    [_lock unlock];
}

- (NSUInteger)count {
    
    [_lock lock];
    NSUInteger count = [_array count];
    [_lock unlock];
    
    return count;
}

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile {
    
    NSArray *array = [self fetchArray];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
    array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    BOOL b = [array writeToFile:path atomically:useAuxiliaryFile];
    if (!b) {}
    
    return b;
}

- (NSArray *)fetchArray {
    
    [_lock lock];
    NSArray *array = [NSArray arrayWithArray:_array];
    [_lock unlock];
    
    return array;
}

@end
