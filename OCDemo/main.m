//
//  main.m
//  OCDemo
//
//  Created by RaoJia on 2016/11/21.
//  Copyright © 2016年 RaoJia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import "Cat.h"
#import "MyArray.h"
#import "NSString+ReverseString.h"
#import "Foo.h"

#pragma mark - 内存管理
#pragma mark  测试内存管理1
void testMemManage1()
{
    
    Dog *dog1 = [[Dog alloc] init];
    [dog1 setID:1];
    
    Dog *dog2 = [[Dog alloc] init];
    [dog2 setID:2];
    
    Person *person1 = [[Person alloc] init];
    [person1 setName:@"小明"];
    [person1 setDog:dog1];
    NSLog(@"Dog1 retain count is: %ld", [dog1 retainCount]);
    
    [person1 setDog:dog2];
    NSLog(@"Dog1 retain count is: %ld", [dog1 retainCount]);
    
    Person *person2  = [[Person alloc] init];
    [person2 setName:@"小王"];
    [person2 setDog:dog1];
    
    NSLog(@"Dog retain count is: %ld", [dog1 retainCount]);
    
    [dog1 release];
    
    NSLog(@"Dog retain count is: %ld", [dog1 retainCount]);
    
    [person1 release];
    
    NSLog(@"Dog retain count is: %ld", [dog1 retainCount]);
    
    [person2 release];
    
}

#pragma mark 内存管理2 -模拟一个数组
void testMemManage2()
{
    MyArray *myArray = [[MyArray alloc] init];
    for(int i=0; i<4; i++){
        Dog *d = [[Dog alloc] init];
        [d setID:i];
        NSLog(@"dog %d retainCount is %ld", d.ID, [d retainCount]);
        [myArray addObject:d];
        NSLog(@"dog %d retainCount is %ld", d.ID, [d retainCount]);
        [d release];
        NSLog(@"dog %d retainCount is %ld", d.ID, [d retainCount]);
        
    }
    [myArray release];
}

#pragma mark - 协议
#pragma mark protocol
void testProtocol()
{
    Person *person1 = [[Person alloc] init];
    Dog *dog1 = [[Dog alloc] init];
    
    [dog1 setID:1];
    
    [person1 setName: @"raojia"];
    //        [person1 setDog: dog1]; //==person1.dog = dog1;
    [dog1 release];
    
    while(1){
        [[NSRunLoop currentRunLoop] run];
    }
    
    //[person1 release];
    
}

//category扩展函数方法
void testCategory()
{
    NSString *originStr = @"乐视云计算Live";
    NSString *reversStr = [originStr reverseString];
    NSLog(@"Reverse:%@", reversStr);
}

#pragma mark - block使用
#pragma mark block 常用
void testBlock()
{
    void (^myBlock1) (void) = NULL;
    myBlock1 = ^(void) {
        NSLog(@"执行block里的函数!");
    };
    myBlock1();
    
    
    int (^myBlock2)(int a, int b) = ^(int a, int b){
        return a+b;
    };
    int ret = myBlock2(1,2);
    NSLog(@"block2 结果:%d",  ret );
    
    
    __block int sum =4;
    int (^myBlock3) (int a, int b) = ^(int a, int b){
        return sum + a + b;
    };
    NSLog(@"block3 结果:%d", myBlock3(1,2));
    
}

#pragma mark 使用block代替protocol
void testBlock2()
{
    
    Person *p = [[Person alloc] init];
    Cat *c = [[Cat alloc] init];
    [c setID:88];
    [p setCat:c];
    [c release];
    
    while (1) {
        [[NSRunLoop currentRunLoop] run];
    }
}

#pragma mark - 字符串
#pragma mark 文件中读取字符串
void testImportString()
{
    NSString *str1 = @"aaa";
    NSLog(@"字符串:%@", str1);
    
    NSError *error;
    NSString *path = @"/Users/raojia/Downloads/new 1.txt";
    NSString *str2 = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if(error){
        NSLog(@"文件读取失败：%@",error);
    }else{
        NSLog(@"文件读取字符串：%@",str2);
    }
}


#pragma mark 字符串操作
void stringOperation()
{
    NSString *str = @"12345678901234567890.txt";
    
    // 从头部开始搜索
    NSLog(@"字符串位置：%@", NSStringFromRange([str rangeOfString:@"345"]));
    
    
    NSString *word = @"888";
    NSRange range = [str rangeOfString:word options:NSBackwardsSearch];
    if(range.location == NSNotFound){
        NSLog(@"未找到字符串:%@", word);
    }else{
        NSLog(@"字符串位置：%@", NSStringFromRange(range));
    }
    
    //字符串截取
    //从头部截取到位置3
    NSLog(@"截取字符串：%@", [str substringToIndex:3]);
    //从头截取到
    NSLog(@"截取字符串：%@", [str substringFromIndex:3]);
    //中间截取
    NSLog(@"截取字符串：%@", [str substringWithRange: NSMakeRange(3, 2)]);
    
    //字符串拆分
    NSString *strArray = @"1,2,3,4,5,6,7,8";
    NSArray *listItems = [strArray componentsSeparatedByString:@","];
    NSLog(@"拆分字符串：%@", listItems); //默认NSArray的description是打印每个元素
}

#pragma mark 字符串操作2
void stringOperation2()
{
    //创建一个可自动释放的数组
    NSMutableArray *pathArray = [NSMutableArray array];
    [pathArray addObject:@"com.letv.com"];
    [pathArray addObject:@"opendev"];
    [pathArray addObject:@"app01"];
    NSString *pathStr = [NSString pathWithComponents:pathArray];
    NSLog(@"路径为：%@", pathStr);
    
    NSArray *pathArray2 = [pathStr pathComponents];
    NSLog(@"元素为：%@", pathArray2);
    
    
    NSMutableString  *mStr = [[NSMutableString alloc] initWithCapacity:10];
    [mStr setString:@"乐视云计算"];
    [mStr appendString:@"saas产研部门"];
    
    NSLog(@"替换前，可变字符串为：%@", mStr);
    
    NSRange range = [mStr rangeOfString:@"saas"];
    if(range.location != NSNotFound){
        [mStr replaceCharactersInRange:range withString:@"iaas"];
    }
    NSLog(@"替换后，可变字符串为：%@", mStr);
    
    [mStr release];
    
}

#pragma mark - 数组
#pragma mark 数组操作
void arrayOperation()
{
    Dog *d1 = [[Dog alloc] init];
    d1.ID = 8; //[d1 setID:8];
    
    Person *p1 = [[Person alloc] init];
    p1.Name = @"张三";
    Person *p2 = [[Person alloc] init];
    p2.Name = @"李四";
    Person *p3 = [[Person alloc] init];
    p3.Name = @"王五";    
    Person *p4 = [Person person]; //静态方法初始化，带默认参数
    Person *p5 =  [Person personWithName:@"静态带参数" andDog:d1 andCat:nil]; //带参数初始化
    
    
    NSArray *array = [NSArray arrayWithObjects:p1,p2,p3,nil]; //静态方法不需要释放
    array = [array arrayByAddingObject:p4] ; //添加数组元素
    array = [array arrayByAddingObject:p5]; //添加数组元素
    
    [array makeObjectsPerformSelector:@selector(setDog:) withObject:d1]; //每个person给一条狗
    [d1 release]; //需要release
    
    NSLog(@"打印数组:%@", array);
    
    //block遍历，官方推荐
    [array enumerateObjectsUsingBlock:
     ^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         NSLog(@"%lu-%@", (unsigned long)idx, obj);
         //当遍历到第二个时停止循环
         if(idx==1){
             // 利用指针修改外部BOOL的值
             *stop = YES;
             
         }
     }];
    
    [p1 release]; //非autorelease 则需要 release
    [p2 release];
    [p3 release];
    
}


#pragma mark 可变长数组操作
void arrayOperation2()
{
    NSMutableArray *mArray = [NSMutableArray array];
    
    Dog *d = [[[Dog alloc]init]autorelease];
    d.ID = 9;
    Person *p1 = [Person personWithName:@"甲" andDog:nil andCat:nil];
    Person *p2 = [Person personWithName:@"乙" andDog:nil andCat:nil];
    
    [mArray addObject:p1];
    [mArray addObject:p2];
    
    //[mArray release]; 不需要release否则报错
}


#pragma mark 哈希表操作
void dictionaryOperation()
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"value1嗯嗯",@"key1",
                           @"value2嘻嘻",@"key2",
                           @"value3呵呵",@"key3",
                           @"value4哈哈",@"key4", nil];
    
    NSLog(@"长度：%zi", dict.count);
    
    id obj = [dict objectForKey:@"key1"];
    NSLog(@"对象为：%@",obj );
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  key, id  obj, BOOL * stop) {
        NSLog(@"%@=%@", key, obj);
    }];
    
}

typedef struct {
    int year;
    int month;
    int day;
} MyDate;

#pragma mark 操作封装对象
void fengzhuangOperation()
{

    CGPoint point  = CGPointMake(10, 7);
    NSValue *value = [NSValue valueWithPoint:point];
    NSLog(@"结构体为：%@", value);
    
    CGPoint point2 =  [value pointValue];
    BOOL result = CGPointEqualToPoint(point, point2);
    if(result){
        NSLog(@"传入与传出相同！");
    }
    
    //自定义结构体
    MyDate myDate = {2016,11,13};
    char *name = @encode(MyDate); //返回C语言字符串
    NSValue *myDateValue = [NSValue value:&myDate withObjCType:name];
    //NSLog(@"自定义结构体：%@", myDateValue);
    MyDate newDate;
    [myDateValue getValue:&newDate];
    NSLog(@"自定义结构体为：%i-%i-%i", newDate.year, newDate.month, newDate.day);
    
}

#pragma mark 反射
void reflect()
{
    Class dogClass = NSClassFromString(@"Dog");
    id dog = [[dogClass alloc] init];
    if([dog isMemberOfClass: [Dog class]]){
        NSLog(@"Class is %@", [dog class] );
    }
    
    if([dog isKindOfClass:[NSObject class]]){
        NSLog(@"Class is %@", [NSObject class]);
    }
    
    SEL setSel =  NSSelectorFromString(@"setName:");
    [dog performSelector:setSel withObject:@"Harry"]; //只允许传OC对象
    
    SEL getSel = NSSelectorFromString(@"Name");
    id name = [dog performSelector:getSel];
    if(name){
        NSLog(@"Class call %@ return %@", NSStringFromSelector(getSel), name);
    }
    [dog release];
}


int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        reflect();
    }
    
    return 0;
}
