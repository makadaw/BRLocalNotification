//
//  BRLocalNotificationButton.m
//  BRLocalNotification
//
//  Created by Alexander on 12.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import "BRLocalNotificationView.h"
#import <QuartzCore/QuartzCore.h>

@interface BRLocalNotificationView ()
@property (strong, readwrite) UILabel *applicationLabel;
@property (strong, readwrite) UILabel *alerLabel;
@property (strong, readwrite) UIImageView *iconView;
@property (strong) UIView *line;

@end

@implementation BRLocalNotificationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]
                                                        initWithTarget:self
                                                                action:@selector(viewTap:)];
        [self addGestureRecognizer:gesture];
        
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = [UIColor colorWithWhite:.905 alpha:1];
        [self addSubview:self.line];
        
        self.applicationLabel = [[UILabel alloc] init];
        [self addSubview:self.applicationLabel];
        self.applicationLabel.font = [UIFont boldSystemFontOfSize:12];
        self.applicationLabel.backgroundColor = [UIColor clearColor];
        
        self.alerLabel = [[UILabel alloc] init];
        [self addSubview:self.alerLabel];
        self.alerLabel.font = [UIFont systemFontOfSize:11];
        self.alerLabel.backgroundColor = [UIColor clearColor];
        
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:self.iconView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = @[(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor colorWithWhite:.9215 alpha:1].CGColor];
    [self.layer insertSublayer:gradient atIndex:0];
    gradient.cornerRadius = 5;
    self.layer.cornerRadius = 5;
    
    self.applicationLabel.frame = CGRectMake(40, 4, self.bounds.size.width-30, 14);
    self.alerLabel.frame = CGRectMake(40, 22, self.bounds.size.width-30, 12);
    self.iconView.center = CGPointMake(15, self.bounds.size.height/2);
    self.line.frame = CGRectMake(31, 2, 1, self.bounds.size.height-4);
}

- (void)viewTap:(UITapGestureRecognizer*)gesture
{
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
