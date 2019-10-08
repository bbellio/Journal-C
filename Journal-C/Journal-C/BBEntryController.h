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

+ (BBEntryController *)sharedInstance;

@property (nonatomic) NSMutableArray<BBEntry *> * entries;

- (void)addEntryWith:(NSString *)title body:(NSString *)body;
- (void)remove:(BBEntry *)entry;
- (void)udpate:(BBEntry *)entry title:(NSString *)title body:(NSString *)body;
- (void)saveToPersistentStorage;
- (void)loadToPersistentStorage;
- (NSDictionary *)dictionaryCopy;
@end

NS_ASSUME_NONNULL_END
