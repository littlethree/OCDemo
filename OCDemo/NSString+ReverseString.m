//
//  NSString+ReverseString.m
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//

#import "NSString+ReverseString.h"

@implementation NSString (ReverseString)

- (id) reverseString
{
    NSInteger len = [self length];
    NSMutableString *retStr = [NSMutableString stringWithCapacity:len];
    
    while (len>0) {
        unichar c = [self characterAtIndex:--len];
        NSLog(@"letter is %C", c);
        NSString *s = [NSString stringWithFormat:@"%C", c];
        [retStr appendString:s];
    }
    return retStr;
}

@end
