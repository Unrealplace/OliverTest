//
//  modelArray.h
//  KVOTableView
//
//  Created by LiYang on 16/7/31.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface modelArray : NSObject

@property (nonatomic,retain)NSMutableArray * dataArray;
@property (nonatomic,copy)NSString * string;
-(id)initWithDic:(NSDictionary *)dic;

@end
