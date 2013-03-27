//
//  BRLocalNotificationCenter.h
//  BRLocalNotification
//
//  Created by Alexander on 14.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BRLocalNotificationDelegate.h"

@class BRLocalNotification;

@interface BRLocalNotificationCenter : NSObject
@property id<BRLocalNotificationDelegate> delegate;

+ (BRLocalNotificationCenter*)defaultCenter;

- (void)showLocalNotification:(BRLocalNotification*)notification;

@end
