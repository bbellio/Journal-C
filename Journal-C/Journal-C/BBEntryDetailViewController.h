//
//  BBEntryDetailViewController.h
//  Journal-C
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBEntryDetailViewController : UIViewController

@property (nonatomic, strong) BBEntry *entry;

@property (weak, nonatomic) IBOutlet UITextField *entryTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

- (void)updateViews;
- (void)textFieldShouldReturn;
//- (void)updateWith:(BBEntry *)entry;

@end

NS_ASSUME_NONNULL_END
