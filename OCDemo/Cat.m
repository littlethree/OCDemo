//
//  Cat.m
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//


#import "Cat.h"

@implementation Cat

@synthesize ID = _ID;

- (id) init
{
    self = [super init];
    if(self){
        SEL sel = @selector(updateTimer:);
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:sel userInfo:nil repeats:YES];
    }
    return self;
}


- (void) setCatCallback: (void (^)( Cat *, int )) block
{
    [catCallback release];     //清理掉之前的block
    catCallback = [block copy]; //拷贝一份，防止block在外部被release
}


- (void) updateTimer: (id)arg
{
    _miaoCount++;
    NSLog(@"Cat miao count: %d", _miaoCount);
    
    // 调用person传过来的block
    if(catCallback)
        catCallback(self,_miaoCount);
}


- (void) dealloc
{
    NSLog(@"Cat %d destroy!", _ID);
    [catCallback release];
    [super dealloc];
}



@end
