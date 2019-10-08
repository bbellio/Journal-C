//
//  BBEntryListTableViewController.m
//  Journal-C
//
//  Created by Bethany Wride on 10/7/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBEntryListTableViewController.h"
#import "BBEntryController.h"
#import "BBEntryDetailViewController.h"

@interface BBEntryListTableViewController ()

@end

@implementation BBEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear
{
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return BBEntryController.sharedInstance.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    BBEntry * entry = BBEntryController.sharedInstance.entries[indexPath.row];
    cell.textLabel.text = entry.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BBEntry * entry = BBEntryController.sharedInstance.entries[indexPath.row];
        [BBEntryController.sharedInstance remove:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toDetailVC"]) {
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        BBEntryDetailViewController *destination = segue.destinationViewController;
        BBEntry *entry = BBEntryController.sharedInstance.entries[[index row]];
        destination.entry = entry;
    }
}

@end
