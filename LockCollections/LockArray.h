//
//  LockArray.h
//  LockCollections
//
//  Created by chenkaijie on 2018/7/18.
//  Copyright © 2018年 ckj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LockArray : NSObject

- (instancetype)initWithMutableArray:(NSMutableArray *)array;
+ (instancetype)array;
+ (instancetype)arrayWithMutableArray:(NSMutableArray *)array;

- (id)objectAtIndex:(NSUInteger)index;
- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)removeObject:(id)anObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObjectsInArray:(NSArray *)otherArray;

- (BOOL)containsObject:(id)anObject;

- (id)firstObject;
- (id)lastObject;

- (void)setValue:(id)value forKey:(NSString *)key;
- (id)valueForKey:(NSString *)key;

- (void)setArray:(NSArray *)array;
- (void)addObjectsFromArray:(NSArray *)otherArray;

- (void)removeLastObject;
- (void)removeAllObjects;

- (NSUInteger)count;

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;

- (NSArray *)fetchArray;

@end
