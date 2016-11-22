//
//  Foo.m
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//

#import "Foo.h"

@interface Foo(Private)
- (void) test2;
@end

@implementation Foo

- (void) test
{
    [self test2];
}

- (void) test2
{
    NSLog(@"test2 is calling");
}

@end
