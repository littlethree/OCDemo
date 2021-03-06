//
//  Dog.h
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

@interface Dog : NSObject
{
    int _ID;
    NSTimer *_timer;
    int _barkCount;
    
    NSString *_name;
    id <MyProtocol> delegate;
}

@property int ID;
@property int barkCount;
@property (nonatomic,copy) NSString* Name;
@property (assign) id <MyProtocol> delegate;

@end
