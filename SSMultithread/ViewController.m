//
//  ViewController.m
//  SSMultithread
//
//  Created by Jason.Liu on 17/2/7.
//  Copyright © 2017年 ViiCat.com. All rights reserved.
//

#import "ViewController.h"
#import "GCDMultithread.h"

@interface ViewController ()
@property (nonatomic, strong) GCDMultithread *gcdMultithread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUI];
}

- (void)createUI{
    
    CGRect _rect = self.view.bounds;
    
    if (!self.btnRefreshUI) {
        self.btnRefreshUI = [self createButtonWithTitle:@"后台执行完更新UI"];
        self.btnRefreshUI.frame = CGRectMake(_rect.origin.x, _rect.origin.y + 50, _rect.size.width, 30);
        [self.btnRefreshUI addTarget:self action:@selector(refreshUIClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.btnSerial) {
        self.btnSerial = [self createButtonWithTitle:@"串行队列"];
        self.btnSerial.frame = CGRectMake(_rect.origin.x, _rect.origin.y + 100, _rect.size.width, 30);
        [self.btnSerial addTarget:self action:@selector(serialQueueClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.btnConcurrent) {
        self.btnConcurrent = [self createButtonWithTitle:@"并行队列"];
        self.btnConcurrent.frame = CGRectMake(_rect.origin.x, _rect.origin.y + 150, _rect.size.width, 30);
        [self.btnConcurrent addTarget:self action:@selector(concurrentQueueClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.btnGroup) {
        self.btnGroup = [self createButtonWithTitle:@"gourp队列"];
        self.btnGroup.frame = CGRectMake(_rect.origin.x, _rect.origin.y + 200, _rect.size.width, 30);
        [self.btnGroup addTarget:self action:@selector(groupQueueClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.btnBarrier) {
        self.btnBarrier = [self createButtonWithTitle:@"dispatch障碍"];
        self.btnBarrier.frame = CGRectMake(_rect.origin.x, _rect.origin.y + 250, _rect.size.width, 30);
        [self.btnBarrier addTarget:self action:@selector(barrierClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.view addSubview:self.btnRefreshUI];
    [self.view addSubview:self.btnSerial];
    [self.view addSubview:self.btnConcurrent];
    [self.view addSubview:self.btnGroup];
    [self.view addSubview:self.btnBarrier];
}

#pragma mark - <Action>
- (void)refreshUIClick{
    [self.gcdMultithread refreshUIWithBackgroundTask:self];
}

- (void)serialQueueClick{
    [self.gcdMultithread serialQueue];
}

- (void)concurrentQueueClick{
    [self.gcdMultithread concurrenQueue];
}

- (void)groupQueueClick{
    [self.gcdMultithread groupQueue];
}

- (void)barrierClick{
    [self.gcdMultithread barrierDispatch];
}

#pragma mark - <Other>
- (UIButton *)createButtonWithTitle:(NSString *)title{
    UIButton *btn = [[UIButton alloc]init];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:title forState:UIControlStateNormal];
    return btn;
}

#pragma mark - <LazayLoad>
- (GCDMultithread *)gcdMultithread{
    if (!_gcdMultithread) {
        _gcdMultithread = [[GCDMultithread alloc] init];
    }
    return _gcdMultithread;
}

#pragma mark - <LifeCycle>
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
