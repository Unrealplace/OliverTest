//
//  ViewController.h
//  KVOTableView
//
//  Created by LiYang on 16/7/31.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class modelArray;
@class NSTimer;

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *kvoTableView;

@property (nonatomic,strong)modelArray * model;
@property (nonatomic,strong)NSTimer * timer;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;

@end

