//
//  ViewController.m
//  KVOTableView
//
//  Created by LiYang on 16/7/31.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "ViewController.h"
#import "modelArray.h"
#import "NSTimer+DelegateSelf.h"

#define TimeInterval 5.0
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{

    BOOL aaa;
}

@end

@implementation ViewController



- (void)dealloc
{
    //第三步
    if (_model != nil) {
        [_model removeObserver:self forKeyPath:@"dataArray"];
    }
    //停止定时器
    if (_timer != nil) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSMutableArray arrayWithCapacity:0] forKey:@"modelArray"];
        
       // self.model = [[model alloc] initWithDic:dic];
        self.model = [[modelArray alloc] init];
        
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setUI];
}

-(void)setData{
    aaa = 1;
    self.model = [[modelArray alloc] init];

    [_model addObserver:self forKeyPath:@"dataArray" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
   // [self startTimer];

}
//添加定时器
-(void)startTimer
{
    __block ViewController *bself = self;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:TimeInterval block:^{
        
       // [bself changeArray];
    } repeats:YES];
    
}
//增加数组中的元素 自动刷新tableview
-(void)changeArray
{
    
    NSString *str = [NSString stringWithFormat:@"%d",arc4random()%100];
    [[_model mutableArrayValueForKey:@"dataArray"] addObject:str];
    
    NSLog(@"%@",_model.dataArray);
    
}
//第二步 处理变化
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(nullable void *)context
{
    if ([keyPath isEqualToString:@"dataArray"]) {
        if (self.model.dataArray.count == 0) {
            NSLog(@"show nodataUI");
        }
        [self.kvoTableView reloadData];
    }
}
-(void)setUI{

    self.kvoTableView.delegate = self;
    self.kvoTableView.dataSource = self;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _model.dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * cellid = @"cellid";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
    
}
- (IBAction)changeBtnClick:(id)sender {
    
    if (aaa) {
        sleep(3);
        [[_model mutableArrayValueForKey:@"dataArray"] addObject:@"haha"];
    }else{
    
         [[_model mutableArrayValueForKey:@"dataArray"] removeObject:@"haha"];
    }
    
    aaa = !aaa;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
