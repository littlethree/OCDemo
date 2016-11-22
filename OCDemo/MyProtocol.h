//
//  MyProtocol.h
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dog;

@protocol MyProtocol <NSObject>

@required

- (void) procDogBark: (Dog *)dog andCount:(int)count;

@end
