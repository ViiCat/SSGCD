//
//  GCDMultithread.h
//  SSMultithread
//
//  Created by Jason.Liu on 17/2/7.
//  Copyright © 2017年 ViiCat.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface GCDMultithread : NSObject

///后台执行任务,主线程更新UI
- (void)refreshUIWithBackgroundTask:(ViewController *)viewController;

///串行队列
- (void)serialQueue;

///并行队列
- (void)concurrenQueue;

///A、B、C... 都执行完后执行notify
- (void)groupQueue;

///A、B、barrier、C;barrier从中隔离分成A、B和C两部分
- (void)barrierDispatch;
@end
