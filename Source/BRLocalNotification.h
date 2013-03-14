//
//  BRLocalNotification.h
//  BRLocalNotification
//
//  Created by Alexander on 12.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BRLocalNotificationView;

@interface BRLocalNotification : NSObject
@property (nonatomic, strong, readonly) BRLocalNotificationView *notificationView;

- (id)initWithLocalNotification:(UILocalNotification*)localNotification;
- (void)show;

@end
