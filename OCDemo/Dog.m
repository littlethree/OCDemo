//
//  Dog.m
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//
#import "Dog.h"

@implementation Dog

@synthesize ID = _ID;
@synthesize barkCount = _barkCount;
@synthesize delegate;

//初始化
- (id) init
{
    if(self = [super init]){
        //创建定时器，每1.0秒调用 updateTimer：
//        SEL sel = @selector(updateTimer:);
//        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:(sel) userInfo:nil repeats:YES];
    }
    return self;
}

- (void) updateTimer:(id)arg
{
    _barkCount++;
    NSLog(@"Dog bark count: %d!", _barkCount);
    
    if( [delegate respondsToSelector:@selector(procDogBark:andCount:)])
        [delegate procDogBark:self andCount: _barkCount]; //调用delegate的处理方法
}


- (void) dealloc
{
    NSLog(@"Dog %d is dealloc!", _ID);
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Dog ID is %i", _ID];
}


@end
