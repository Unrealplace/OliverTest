//
//  NSTimer+DelegateSelf.m
//  KVOTableView
//
//  Created by LiYang on 16/7/31.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "NSTimer+DelegateSelf.h"

@implementation NSTimer (DelegateSelf)


+(NSTimer *)scheduledTimerWithTimeInterval:(int)timeInterval block:(void(^)())block repeats:(BOOL)yesOrNo
{
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(callBlock:) userInfo:[block copy] repeats:yesOrNo];
}


+(void)callBlock:(NSTimer *)timer
{
    void(^block)() = timer.userInfo;
    if (block != nil) {
        block();
    }
}
@end
