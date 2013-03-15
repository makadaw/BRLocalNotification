//
//  BRLocalNotificationCenter.m
//  BRLocalNotification
//
//  Created by Alexander on 14.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import "BRLocalNotificationCenter.h"
#import "BRLocalNotification.h"
#import "BRLocalNotificationView.h"
#import <QuartzCore/CoreAnimation.h>

#define DEFAULT_ANIMATION_TIME .7

@interface BRLocalNotificationCenter ()
@property (strong) NSMutableArray *notificationsQueue;
@property (weak) BRLocalNotification *currentNotification;
@property (nonatomic, weak) UIView *window;
@property (strong) NSTimer *timer;

@end

@implementation BRLocalNotificationCenter

+ (BRLocalNotificationCenter*)defaultCenter
{
    static dispatch_once_t onceToken;
    static BRLocalNotificationCenter *defaultLocalNotificationCenter;
    dispatch_once(&onceToken, ^{
        defaultLocalNotificationCenter = [[BRLocalNotificationCenter alloc] init];
    });
    return defaultLocalNotificationCenter;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.notificationsQueue = [NSMutableArray array];
    }
    return self;
}

- (void)showLocalNotification:(BRLocalNotification*)notification
{
    [self.notificationsQueue addObject:notification];
    [self showFirstNotification];
}

- (void)showFirstNotification
{
    if (self.notificationsQueue.count > 0 && self.currentNotification == nil) {
        BRLocalNotification *notification = self.notificationsQueue[0];
        self.currentNotification = notification;
        
        BRLocalNotificationView *view = notification.notificationView;
        view.frame = CGRectMake(0, -80, self.window.bounds.size.width, 40);
        [view addTarget:self
                 action:@selector(notificationAction:)
       forControlEvents:UIControlEventTouchUpInside];
        [self.window addSubview:view];
        [self.window bringSubviewToFront:view];
        
        [UIView animateWithDuration:DEFAULT_ANIMATION_TIME animations:^(){
            view.center = CGPointMake(self.window.bounds.size.width/2, 40);
        }];
        
        [UIView animateWithDuration:DEFAULT_ANIMATION_TIME animations:^(){} completion:^(BOOL finished){}];
        
        if (self.timer) {
            [self.timer invalidate];
        }
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5
                                                          target:self
                                                        selector:@selector(showNextNotification)
                                                        userInfo:@{@"notification": notification}
                                                         repeats:NO];
        self.timer = timer;
        
    }
}

- (void)notificationAction:(id)sender
{
    [self showNextNotification];
}

- (void)showNextNotification
{
    if (self.timer) {
        [self.timer invalidate];
    }
    self.currentNotification.notificationView.userInteractionEnabled = NO;
    CGPoint center = self.currentNotification.notificationView.center;
    center.y = -40;
    [UIView animateWithDuration:DEFAULT_ANIMATION_TIME
                     animations:^(){
                         self.currentNotification.notificationView.center = center;
                     }
                     completion:^(BOOL finished){
                         [self.currentNotification.notificationView removeFromSuperview];
                         [self.notificationsQueue removeObject:self.currentNotification];
                         self.currentNotification = nil;
                         [self showFirstNotification];
                     }];
}

- (UIView*)window
{
    if (_window == nil) {
        _window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    }
    return _window;
}

@end
