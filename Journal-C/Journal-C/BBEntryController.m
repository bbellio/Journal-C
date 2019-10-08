//
//  BBEntryController.m
//  Journal-C
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBEntryController.h"
#import "BBEntry.h"

@implementation BBEntryController

+ (BBEntryController *)sharedInstance {
    static BBEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [BBEntryController new];
    });
    return sharedInstance;
}

- (void)addEntryWith:(NSString *)title body:(NSString *)body
{
    BBEntry *entry = [[BBEntry alloc] initWithTitle:title bodyText:body];
    [_entries addObject:entry];
}

- (void)remove:(BBEntry *)entry
{
    [_entries removeObject:entry];
}

- (void)udpate:(BBEntry *)entry title:(NSString *)title body:(NSString *)body
{
    title = entry.title;
    body = entry.bodyText;
}


-(NSDictionary *)dictionaryCopy
{
    BBEntry *entry = [BBEntry alloc];
    static NSString * const TimeStampKey = @"timestamp";
    static NSString * const TitleKey = @"title";
    static NSString * const BodyTextKey = @"bodyText";
    
    NSDictionary *journalDictionary = @{TimeStampKey : entry.timestamp, TitleKey : entry.title, BodyTextKey : entry.bodyText};
    
    return journalDictionary;
}

-(void)saveToPersistentStorage
{
    for(BBEntry * entry in _entries)
    {
        [self dictionaryCopy];
    }
}

-(void)loadToPersistentStorage
{
    
}
@end
