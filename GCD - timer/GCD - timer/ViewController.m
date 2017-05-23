//
//  ViewController.m
//  GCD - timer
//
//  Created by kkk on 17/4/24.
//  Copyright © 2017年 bianming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *laber;

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.laber sizeToFit];
    /****** GCD 执行 NSTimer ******/
    //一个runloop的一个模式下 要执行三个事情 Source Obsevet Timer
    //Timer 是时钟事件
    //Source 事件源 函数调用栈 分为-source0:非内核事件 比如 点击按钮/屏幕 source1:系统内核事件
    //获取全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    self.timer =  dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //GCD定时器非常精确 其单位是纳秒 所以要加9个0
    dispatch_time_t interval = 1000000000;
    //设置时间
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, interval, 0);
    //设置执行事件
    dispatch_source_set_event_handler(self.timer, ^{
        
    });
    
    //启动定时器
    dispatch_resume(self.timer);
    
    //Obsever:观察者


}

- (void)dealloc {
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
