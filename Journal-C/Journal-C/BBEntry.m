//
//  BBEntry.m
//  Journal-C
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBEntry.h"

@implementation BBEntry

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    self = [super init];
    if (self)
    {
        _title = title;
        _bodyText = bodyText;
        _timestamp = [[NSDate alloc] init];
    }
    return self;
}

@end
