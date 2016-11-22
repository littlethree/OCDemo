//
//  Person.m
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//

#import "Person.h"
#import "MyProtocol.h"
#import "Dog.h"
#import "Cat.h"


@implementation Person

@synthesize Name = _name;
@synthesize Dog = _dog;
@synthesize Cat = _cat;


#pragma mark - 生命周期方法



#pragma mark - 公共方法
#pragma mark 静态方法初始化
+ (id) person
{
    Person *p =  [[[self alloc] init] autorelease];
    if(p){
        p.Name = @"未知";
    }
    return p;
}

#pragma mark 参数初始化
+ (id) personWithName:(NSString *)name andDog:(Dog *)dog andCat:(Cat *)cat
{
    Person *p = [Person person];
    if(p){
        p.Name = name;
        p.Dog = dog;
        p.Cat = cat;
    }
    return p;
}



- (void) setDog:(Dog *)aDog
{
    if(_dog != aDog  ){
        [_dog release]; //释放掉之前的
        _dog = [aDog retain];//让_dog计数器加1
        [_dog setDelegate:self]; //设置狗的主人
    }
}

- (Dog *) Dog{
    return _dog;
}


- (void) procDogBark: (Dog*) dog andCount:(int) count
{
    NSLog(@"Dog %d is bark %d", [dog ID], count);
}


- (void) setCat: (Cat *) aCat
{
    if(_cat != aCat ){
        [_cat release];
        _cat = [aCat retain];
        
        // 设置cat的callback的Block
        void (^callBack) (Cat *cat, int miaoCount) = ^(Cat *cat, int miaoCount){
            NSLog(@"Cat %d callBack %d!", cat.ID, miaoCount);
        };
        [_cat setCatCallback: callBack];
        
        //销毁临时block
        [callBack release];
    }
}

- (Cat *) Cat
{
    return _cat;
}

- (void) dealloc
{
    NSLog(@"Person %@ is dealloc", _name);
    
    self.Dog = nil; // =[_dog release]; = [self setDog:nil]，但比后者更彻底
    self.Cat = nil;
        
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Person name is %@, Dog is %@", _name, _dog];
}

@end
