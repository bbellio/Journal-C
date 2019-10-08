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
    _entryTitleTextField.text = @"";
    _bodyTextView.text = @"";
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender
{
    if (_entry) {
        [BBEntryController.sharedInstance udpate:_entry title:_entry.title body:_entry.bodyText];
    } else {
        [BBEntryController.sharedInstance addEntryWith:_entryTitleTextField.text body:_bodyTextView.text];
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (void)updateViews
{
//    if (_entry) {
        _entryTitleTextField.text = _entry.title;
        _bodyTextView.text = _entry.bodyText;
        self.title = _entry.title;
//    }
}

- (void)textFieldShouldReturn
{
    [_entryTitleTextField resignFirstResponder];
    [_bodyTextView resignFirstResponder];
}
@end
