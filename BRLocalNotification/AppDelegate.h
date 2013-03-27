//
//  AppDelegate.h
//  BRLocalNotification
//
//  Created by Alexander on 12.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRLocalNotificationDelegate.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, BRLocalNotificationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
