//
//  ViewController.m
//  BRLocalNotification
//
//  Created by Alexander on 12.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import "ViewController.h"
#import "BRLocalNotification.h"

@interface ViewController ()
@property (weak) IBOutlet UIDatePicker *countdownPicker;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fireAction:(id)sender
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:.2];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeStyle = NSDateFormatterFullStyle;
    notification.alertBody = [df stringFromDate:[NSDate date]];
    notification.alertAction = @"Action";
    UIApplication *application = [UIApplication sharedApplication];
    [application scheduleLocalNotification:notification];
}

@end
