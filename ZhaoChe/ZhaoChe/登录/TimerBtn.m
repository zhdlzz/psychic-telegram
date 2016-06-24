//
//  TimerBtn.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/24/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "TimerBtn.h"

@interface TimerBtn () {
    NSTimer *timer;
    NSInteger timeLeft;
    BOOL finishedCounting;
}

@end

@implementation TimerBtn

- (void)setTotalTime:(NSInteger)totalTime {
    _totalTime = totalTime;
}

- (void)setStartCounting:(BOOL)startCounting {
    _startCounting = startCounting;
    if (startCounting) {
        timeLeft = _totalTime == 0 ? 60 : _totalTime;
        _totalTime = timeLeft;
        [self animateBtn];
    }
}

- (void)animateBtn {
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.
                                             target:self
                                           selector:@selector(countDown)
                                           userInfo:nil
                                            repeats:YES];
    [timer fire];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)countDown {
    if (self) {
        self.enabled = NO;
        timeLeft--;
        if (timeLeft > 0) {
            [self setTitle:[NSString stringWithFormat:@"重新获取(%02ld)", (long)timeLeft] forState:UIControlStateDisabled];
        } else {
            timeLeft = _totalTime;
            if (timer) {
                [timer invalidate];
                timer = nil;
            }
            
            [self setTitle:@"获取验证码" forState:UIControlStateNormal];
            self.enabled = YES;
            _startCounting = NO;
        }
    }
}

@end
