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

// Make sure to include arguments
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"MM/d h:mm a";
    cell.detailTextLabel.text = [df stringFromDate:entry.timestamp];
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
//    if ([segue.identifier isEqual:@"cellToDetailVC"]) {
//            BBEntryDetailViewController *destinationVC = [segue destinationViewController];
//            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//            BBEntry *entry = [BBEntryController sharedInstance].entries[indexPath.row];
//            [destinationVC updateWith:entry];
//        }
//    }

    if ([segue.identifier isEqual:@"toDetailVC"]) {
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        BBEntryDetailViewController *destination = segue.destinationViewController;
        BBEntry *entry = BBEntryController.sharedInstance.entries[[index row]];
//        [destination updateWith:entry];
        destination.entry = entry;
    }
}
@end
