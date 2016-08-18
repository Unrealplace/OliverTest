//
//  modelArray.m
//  KVOTableView
//
//  Created by LiYang on 16/7/31.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "modelArray.h"

@implementation modelArray
-(instancetype)init{

    if (self =[super init]) {
        self.dataArray = [NSMutableArray array];
    }
    return self;
}

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"undefine key ---%@",key);
}
@end
