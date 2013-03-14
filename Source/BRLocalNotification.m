//
//  BRLocalNotification.m
//  BRLocalNotification
//
//  Created by Alexander on 12.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import "BRLocalNotification.h"
#import "BRLocalNotificationCenter.h"
#import "BRLocalNotificationView.h"

@interface BRLocalNotification ()
@property (strong) UILocalNotification *localNotification;
@property (nonatomic, strong, readwrite) BRLocalNotificationView *notificationView;

@end

@implementation BRLocalNotification

- (id)initWithLocalNotification:(UILocalNotification*)localNotification
{
    self = [self init];
    if (self) {
        self.localNotification = localNotification;
    }
    return self;
}

- (void)show
{
    BRLocalNotificationCenter *notificationCenter = [BRLocalNotificationCenter defaultCenter];
    [notificationCenter showLocalNotification:self];
}

- (BRLocalNotificationView*)notificationView
{
    if (_notificationView == nil) {
        _notificationView = [[BRLocalNotificationView alloc] init];
        _notificationView.alerLabel.text = self.localNotification.alertBody;
    }
    return _notificationView;
}

@end
