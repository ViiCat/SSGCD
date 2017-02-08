//
//  GCDMultithread.m
//  SSMultithread
//
//  Created by Jason.Liu on 17/2/7.
//  Copyright © 2017年 ViiCat.com. All rights reserved.
//

#import "GCDMultithread.h"

@implementation GCDMultithread
///后台执行任务,主线程更新UI
- (void)refreshUIWithBackgroundTask:(ViewController *)viewController{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *str = @"更新主线程UI";
        
        NSLog(@"%@",str);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [viewController.btnRefreshUI setTitle:str forState:UIControlStateNormal];
        });
    });
}

///串行队列
- (void)serialQueue{
    
    dispatch_queue_t queue = dispatch_queue_create("MULT", NULL);
    
    dispatch_async(queue, ^{
        sleep(3);
        NSLog(@"A任务");
    });
    
    dispatch_async(queue, ^{
        sleep(2);
        NSLog(@"B任务");
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"C任务");
    });
}

///并行队列
- (void)concurrenQueue{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        sleep(3);
        NSLog(@"A任务");
    });
    
    dispatch_async(queue, ^{
        sleep(2);
        NSLog(@"B任务");
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"C任务");
    });
}

///A、B、C... 都执行完后执行notify
- (void)groupQueue{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        
        sleep(3);
        NSLog(@"A任务");
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"notify任务");
    });
    
    dispatch_group_async(group, queue, ^{
        
        sleep(2);
        NSLog(@"B任务");
    });
    
    dispatch_group_async(group, queue, ^{
        
        sleep(1);
        NSLog(@"C任务");
    });
    

}

///A、B、barrier、C;barrier从中隔离分成A、B和C两部分
- (void)barrierDispatch{
    
    dispatch_queue_t queue = dispatch_queue_create("MULT", DISPATCH_QUEUE_CONCURRENT);//DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        
        sleep(3);
        NSLog(@"A任务");
    });
    
    dispatch_async(queue, ^{
        
        sleep(2);
        NSLog(@"B任务");
    });
    
    dispatch_async(queue, ^{
        
        sleep(4);
        NSLog(@"X任务");
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier任务");
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"C任务");
    });
    
}

@end
