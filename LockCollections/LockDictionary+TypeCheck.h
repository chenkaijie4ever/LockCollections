//
//  LockDictionary+TypeCheck.h
//  LockCollections
//
//  Created by chenkaijie on 2018/7/18.
//  Copyright © 2018年 ckj. All rights reserved.
//

#import "LockDictionary.h"

@interface LockDictionary (TypeCheck)

- (NSNumber *)numberValueForKey:(id)key;
- (NSString *)stringValueForKey:(id)key;
- (NSArray *)arrayValueForKey:(id)key;
- (NSDictionary *)dictionaryValueForKey:(id)key;
- (NSData *)dataValueForKey:(id)key;

- (int)intValueForKey:(id)key;
- (int)intValueForKey:(id)key defaultValue:(int)defaultValue;
- (long)longValueForKey:(id)key;
- (long)longValueForKey:(id)key defaultValue:(long)defaultValue;
- (NSInteger)integerValueForKey:(id)key;
- (NSInteger)integerValueForKey:(id)key defaultValue:(NSInteger)defaultValue;
- (BOOL)boolValueForKey:(id)key;
- (BOOL)boolValueForKey:(id)key defaultValue:(BOOL)defaultValue;
- (float)floatValueForKey:(id)key;
- (float)floatValueForKey:(id)key defaultValue:(float)defaultValue;
- (double)doubleValueForKey:(id)key;
- (double)doubleValueForKey:(id)key defaultValue:(double)defaultValue;

@end
