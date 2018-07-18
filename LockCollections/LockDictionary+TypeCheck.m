//
//  LockDictionary+TypeCheck.m
//  LockCollections
//
//  Created by chenkaijie on 2018/7/18.
//  Copyright © 2018年 ckj. All rights reserved.
//

#import "LockDictionary+TypeCheck.h"
#import "TypeChecker.h"

@implementation LockDictionary (TypeCheck)

- (NSNumber *)numberValueForKey:(id)key {
    
    return [TypeChecker numberValue:[self valueForKey:key]];
}

- (NSString *)stringValueForKey:(id)key {
    
    return [TypeChecker stringValue:[self valueForKey:key]];
}

- (NSArray *)arrayValueForKey:(id)key {
    
    return [TypeChecker arrayValue:[self valueForKey:key]];
}

- (NSDictionary *)dictionaryValueForKey:(id)key {
    
    return [TypeChecker dictionaryValue:[self valueForKey:key]];
}

- (NSData *)dataValueForKey:(id)key {
    
    return [TypeChecker dataValue:[self valueForKey:key]];
}

- (int)intValueForKey:(id)key {
    
    return [self intValueForKey:key defaultValue:0];
}

- (int)intValueForKey:(id)key defaultValue:(int)defaultValue {
    
    return [TypeChecker intValue:[self valueForKey:key] defaultValue:defaultValue];
}

- (long)longValueForKey:(id)key {
    
    return [self longValueForKey:key defaultValue:0];
}

- (long)longValueForKey:(id)key defaultValue:(long)defaultValue {
    
    return [TypeChecker longValue:[self valueForKey:key] defaultValue:defaultValue];
}

- (NSInteger)integerValueForKey:(id)key {
    
    return [self integerValueForKey:key defaultValue:0];
}

- (NSInteger)integerValueForKey:(id)key defaultValue:(NSInteger)defaultValue {
    
    return [TypeChecker integerValue:[self valueForKey:key] defaultValue:defaultValue];
}

- (BOOL)boolValueForKey:(id)key {
    
    return [self boolValueForKey:key defaultValue:NO];
}

- (BOOL)boolValueForKey:(id)key defaultValue:(BOOL)defaultValue {
    
    return [TypeChecker boolValue:[self valueForKey:key] defaultValue:defaultValue];
}

- (float)floatValueForKey:(id)key {
    
    return [self floatValueForKey:key defaultValue:0.f];
}

- (float)floatValueForKey:(id)key defaultValue:(float)defaultValue {
    
    return [TypeChecker floatValue:[self valueForKey:key] defaultValue:defaultValue];
}

- (double)doubleValueForKey:(id)key {
    
    return [self doubleValueForKey:key defaultValue:0.f];
}

- (double)doubleValueForKey:(id)key defaultValue:(double)defaultValue {
    
    return [TypeChecker doubleValue:[self valueForKey:key] defaultValue:defaultValue];
}

@end
