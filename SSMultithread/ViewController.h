//
//  ViewController.h
//  SSMultithread
//
//  Created by Jason.Liu on 17/2/7.
//  Copyright © 2017年 ViiCat.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 多线程 GCD
 */
@interface ViewController : UIViewController

@property (nonatomic, strong) UIButton *btnRefreshUI;

@property (nonatomic, strong) UIButton *btnSerial;

@property (nonatomic, strong) UIButton *btnConcurrent;

@property (nonatomic, strong) UIButton *btnGroup;

@property (nonatomic, strong) UIButton *btnBarrier;
@end

