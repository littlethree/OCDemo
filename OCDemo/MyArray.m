//
//  MyArray.m
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//

#import "MyArray.h"

@implementation MyArray
@synthesize count = _count;

- (id) init
{
    self = [super init];
    if(self){
        _count = 0;
    }
    return self;
}

- (void) addObject: (id)object
{
    if( _count >= 512){
        return;
    }
    _objs[_count] = [object retain]; //必须要做retain，否则外部release则成为野指针
    _count++;
}

- (id) objectAtIndex: (NSUInteger)index
{
    return _objs[index];
}

- (void) removeObjectAtIndex: (NSUInteger)index
{
    id obj = _objs[index];
    [obj release];
    _objs[index] = nil;
}

- (void) removeAll{
    for(int i=0; i< _count; i++){
        [self removeObjectAtIndex:i];
    }
}

- (void) dealloc
{
    NSLog(@"before remove all");
    [self removeAll];
    NSLog(@"after remove all");
    
    [super dealloc];
}

@end

