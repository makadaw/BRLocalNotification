//
//  BRLocalNotification.h
//  BRLocalNotification
//
//  Created by Alexander on 12.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BRLocalNotificationCenter.h"

@class BRLocalNotificationView;

@interface BRLocalNotification : NSObject
@property (strong, readonly) UILocalNotification *localNotification;
@property (nonatomic, strong, readonly) BRLocalNotificationView *notificationView;

- (id)initWithLocalNotification:(UILocalNotification*)localNotification;
- (void)show;

@end
