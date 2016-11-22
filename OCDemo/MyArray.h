//
//  MyArray.h
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyArray : NSObject
{
    NSUInteger _count;
    id _objs[512];
}
@property (assign, readonly) NSUInteger count;

- (void) addObject: (id)object;
- (id) objectAtIndex: (NSUInteger)index;
- (void) removeObjectAtIndex: (NSUInteger)index;
- (void) removeAll;

@end
