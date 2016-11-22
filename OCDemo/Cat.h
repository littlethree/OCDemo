//
//  Cat.h
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Cat : NSObject

{
    int _ID;
    NSTimer *timer;
    int _miaoCount;
    
    //定义一个Block
    void (^catCallback) (Cat *cat, int miaoCount);
}

@property (assign) int ID;

//向外暴露一个函数
- (void) setCatCallback: ( void (^) (Cat *cat, int miaoCount) ) block;

@end
