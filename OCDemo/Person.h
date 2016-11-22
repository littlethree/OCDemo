//
//  Person.h
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

@class Dog;
@class Cat;

@interface Person : NSObject <MyProtocol>
{
    NSString *_name;
    Dog *_dog;
    Cat *_cat;
}

@property (copy) NSString* Name;
@property (retain) Dog *Dog;
@property (retain) Cat *Cat;

@end
