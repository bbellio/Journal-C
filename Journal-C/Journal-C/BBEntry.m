//
//  BBEntry.m
//  Journal-C
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBEntry.h"

static NSString * const kTitle = @"name";
static NSString * const kBodyText = @"house";
static NSString * const kTimeStamp = @"bloodStatus";

@implementation BBEntry

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    self = [super init];
    if (self)
    {
        _title = title;
        _bodyText = bodyText;
        _timestamp = [NSDate new];
    }
    return self;
}
@end

@implementation BBEntry (JSONConvertable)

- (BBEntry *)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (dictionary[kTitle] == nil || dictionary[kBodyText] == nil || dictionary[kTimeStamp] == nil) {
        return nil;
    }
    
    if (self) {
        _title = dictionary[kTitle];
        _bodyText = dictionary[kBodyText];
        NSTimeInterval timeInterval = [dictionary[kTimeStamp] doubleValue];
        _timestamp = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    }
    
    return self;
}

- (NSDictionary *)dictionaryCopy {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    dictionary[kTitle] = self.title;
    dictionary[kBodyText] = self.bodyText;
    dictionary[kTimeStamp] = [NSNumber numberWithFloat:[self.timestamp timeIntervalSince1970]];
    
    return [dictionary copy];
}
@end


