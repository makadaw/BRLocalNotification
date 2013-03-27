//
//  BRLocalNotification.m
//  BRLocalNotification
//
//  Created by Alexander on 12.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import "BRLocalNotification.h"
#import "BRLocalNotificationView.h"

@interface BRLocalNotification ()
@property (strong, readwrite) UILocalNotification *localNotification;
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
        NSString *applicationName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
        _notificationView.applicationLabel.text = applicationName;
        UIImage *icon = [UIImage imageNamed:@"icon"];
        _notificationView.iconView.image = icon;
    }
    return _notificationView;
}

@end
