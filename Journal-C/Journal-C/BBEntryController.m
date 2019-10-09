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

-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _entries = [NSMutableArray<BBEntry *> new];
        [self loadFromPersistentStore];
    }
    return self;
}

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
    [self.entries addObject:entry];
    [self saveToPersistentStore];
}

- (void)remove:(BBEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStore];
}

- (void)udpate:(BBEntry *)entry title:(NSString *)title body:(NSString *)body
{
    title = entry.title;
    body = entry.bodyText;
    [self saveToPersistentStore];
}

+ (NSURL *)persistentStoreFileURL
{
    NSArray<NSURL *> *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                    inDomains:NSUserDomainMask];
    return [urls[0] URLByAppendingPathComponent:@"journal.json"];
}

- (void)saveToPersistentStore
{
    NSMutableArray *entriesToSave = [NSMutableArray<NSDictionary *> new];
    
    for (BBEntry *entry in self.entries) {
        [entriesToSave addObject:[entry dictionaryCopy]];
    }
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:entriesToSave
                                                       options:kNilOptions
                                                         error:&error];
    if (error) {
        NSLog(@"Unable to convert entries to JSON: %@", error);
        return;
    }
    
    NSURL *url = [BBEntryController persistentStoreFileURL];
    [jsonData writeToURL:url atomically:YES];
}

- (void)loadFromPersistentStore
{
    NSURL *url = [BBEntryController persistentStoreFileURL];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"Error loading JSON data from file: %@", error);
        return;
    }
    
    NSArray *rawEntries = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"Error converting JSON data to NSObject: %@", error);
        return;
    }
    
    NSMutableArray *newEntries = [NSMutableArray new];
    
    for (NSDictionary *entryDict in rawEntries) {
        BBEntry *entry = [[BBEntry alloc] initWithDictionary:entryDict];
        
        if (entry) {
            [newEntries addObject:entry];
        }
    }
    
    self.entries = [newEntries copy];
}
@end
