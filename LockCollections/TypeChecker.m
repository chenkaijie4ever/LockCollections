//
//  TypeChecker.m
//  LockCollections
//
//  Created by chenkaijie on 2018/7/18.
//  Copyright © 2018年 ckj. All rights reserved.
//

#import "TypeChecker.h"

@implementation TypeChecker

+ (NSNumber *)numberValue:(id)value {
    
    return [value isKindOfClass:[NSNumber class]] ? value : nil;
}

+ (NSString *)stringValue:(id)value {
    
    return [value isKindOfClass:[NSString class]] ? value : nil;
}

+ (NSArray *)arrayValue:(id)value {
    
    return [value isKindOfClass:[NSArray class]] ? value : nil;
}

+ (NSDictionary *)dictionaryValue:(id)value {
    
    return [value isKindOfClass:[NSDictionary class]] ? value : nil;
}

+ (NSData *)dataValue:(id)value {
    
    return [value isKindOfClass:[NSData class]] ? value : nil;
}

+ (int)intValue:(id)value defaultValue:(int)defaultValue {
    
    NSNumber *numberVal = [self numberValue:value];
    return numberVal ? [numberVal intValue] : defaultValue;
}

+ (long)longValue:(id)value defaultValue:(long)defaultValue {
    
    NSNumber *numberVal = [self numberValue:value];
    return numberVal ? [numberVal longValue] : defaultValue;
}

+ (NSInteger)integerValue:(id)value defaultValue:(NSInteger)defaultValue {
    
    NSNumber *numberVal = [self numberValue:value];
    return numberVal ? [numberVal integerValue] : defaultValue;
}

+ (BOOL)boolValue:(id)value defaultValue:(BOOL)defaultValue {
    
    NSNumber *numberVal = [self numberValue:value];
    return numberVal ? [numberVal boolValue] : defaultValue;
}

+ (float)floatValue:(id)value defaultValue:(float)defaultValue {
    
    NSNumber *numberVal = [self numberValue:value];
    return numberVal ? [numberVal floatValue] : defaultValue;
}

+ (double)doubleValue:(id)value defaultValue:(double)defaultValue {
    
    NSNumber *numberVal = [self numberValue:value];
    return numberVal ? [numberVal doubleValue] : defaultValue;
}

@end
