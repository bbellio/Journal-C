//
//  BBEntryDetailViewController.m
//  Journal-C
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBEntryDetailViewController.h"
#import "BBEntry.h"
#import "BBEntryController.h"

@interface BBEntryDetailViewController ()

@end

@implementation BBEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (IBAction)clearButtonTapped:(UIButton *)sender
{
    self.entryTitleTextField.text = @"";
    self.bodyTextView.text = @"";
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender
{
    if (self.entry) {
        [BBEntryController.sharedInstance udpate:self.entry title:self.entry.title body:self.entry.bodyText];
    } else {
        [BBEntryController.sharedInstance addEntryWith:self.entryTitleTextField.text body:self.bodyTextView.text];
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (void)updateViews
{
        self.entryTitleTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.bodyText;
        self.title = self.entry.title;
}

- (void)textFieldShouldReturn
{
    [self.entryTitleTextField resignFirstResponder];
    [self.bodyTextView resignFirstResponder];
}

//- (void)updateWith:(BBEntry *)entry {
//    [self loadViewIfNeeded];
//    self.entryTitleTextField.text = entry.title;
//    self.bodyTextView.text = entry.bodyText;
//    self.entry = entry;
//}
@end
