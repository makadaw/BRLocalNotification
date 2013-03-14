//
//  BRLocalNotificationButton.m
//  BRLocalNotification
//
//  Created by Alexander on 12.03.13.
//  Copyright (c) 2013 Bender. All rights reserved.
//

#import "BRLocalNotificationView.h"

@interface BRLocalNotificationView ()
@property (strong, readwrite) UILabel *alerLabel;

@end

@implementation BRLocalNotificationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(viewTap:)];
        [self addGestureRecognizer:gesture];
        
        self.alerLabel = [[UILabel alloc] init];
        [self addSubview:self.alerLabel];
        self.alerLabel.font = [UIFont systemFontOfSize:18];
        self.alerLabel.backgroundColor = [UIColor redColor];
        
        [self.alerLabel addObserver:self
                         forKeyPath:@"text"
                            options:NSKeyValueObservingOptionNew
                            context:nil];
    }
    return self;
}

- (void)dealloc
{
    [self.alerLabel removeObserver:self forKeyPath:@"text"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.alerLabel.frame = CGRectMake(40, 40, self.bounds.size.width-50, 20);
}

- (void)viewTap:(UITapGestureRecognizer*)gesture
{
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
