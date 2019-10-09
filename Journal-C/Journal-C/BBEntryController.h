//
//  BBEntryController.h
//  Journal-C
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBEntryController : NSObject

-(instancetype)init;

+ (BBEntryController *)sharedInstance;

@property (nonatomic, strong) NSMutableArray<BBEntry *> *entries;

- (void)addEntryWith:(NSString *)title body:(NSString *)body;
- (void)remove:(BBEntry *)entry;
- (void)udpate:(BBEntry *)entry title:(NSString *)title body:(NSString *)body;
- (void)saveToPersistentStore;
- (void)loadFromPersistentStore;
@end

NS_ASSUME_NONNULL_END
