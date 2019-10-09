//
//  BBEntry.h
//  Journal-C
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBEntry : NSObject

// Title, bodyText, timestamp

@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, copy, readonly) NSString * bodyText;
@property (nonatomic, copy, readonly) NSDate * timestamp;

- (instancetype)initWithTitle:(NSString *) title
                     bodyText:(NSString *) bodyText;
@end

@interface BBEntry (JSONConvertable)

-(BBEntry *)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)dictionaryCopy;

@end


NS_ASSUME_NONNULL_END
