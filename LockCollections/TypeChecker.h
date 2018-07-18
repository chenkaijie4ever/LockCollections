//
//  TypeChecker.h
//  LockCollections
//
//  Created by chenkaijie on 2018/7/18.
//  Copyright © 2018年 ckj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TypeChecker : NSObject

+ (NSNumber *)numberValue:(id)value;
+ (NSString *)stringValue:(id)value;
+ (NSArray *)arrayValue:(id)value;
+ (NSDictionary *)dictionaryValue:(id)value;
+ (NSData *)dataValue:(id)value;

+ (int)intValue:(id)value defaultValue:(int)defaultValue;
+ (long)longValue:(id)value defaultValue:(long)defaultValue;
+ (NSInteger)integerValue:(id)value defaultValue:(NSInteger)defaultValue;
+ (BOOL)boolValue:(id)value defaultValue:(BOOL)defaultValue;
+ (float)floatValue:(id)value defaultValue:(float)defaultValue;
+ (double)doubleValue:(id)value defaultValue:(double)defaultValue;

@end
