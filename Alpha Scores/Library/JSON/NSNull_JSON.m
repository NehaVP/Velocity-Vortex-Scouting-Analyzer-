//
//  NSNull_JSON.m
//  VelocityVortex
//
//  Created by Neha Parmar on 10/8/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "NSNull_JSON.h"

@implementation NSNull_JSON
- (NSUInteger)length { return 0; }

- (NSInteger)integerValue { return 0; };

- (float)floatValue { return 0; };

- (NSString *)description { return @"0(NSNull)"; }

- (NSArray *)componentsSeparatedByString:(NSString *)separator { return @[]; }

- (id)objectForKey:(id)key { return nil; }

- (BOOL)boolValue { return NO; }

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet{
    NSRange nullRange = {NSNotFound, 0};
    return nullRange;
}

@end
