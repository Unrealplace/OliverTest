//
//  NSTimer+DelegateSelf.h
//  KVOTableView
//
//  Created by LiYang on 16/7/31.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (DelegateSelf)

+(NSTimer *)scheduledTimerWithTimeInterval:(int)timeInterval block:(void(^)())block repeats:(BOOL)yesOrNo;

@end
