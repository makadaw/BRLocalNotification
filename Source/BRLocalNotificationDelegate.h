//
//  BRLocalNotificationDelegate.h
//  BRLocalNotification
//
//  Created by Alexander on 27.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BRLocalNotificationDelegate <NSObject>

@required
- (void)application:(UIApplication *)application didActivatedLocalNotification:(UILocalNotification *)notification;

@end
