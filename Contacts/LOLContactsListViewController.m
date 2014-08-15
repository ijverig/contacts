//
//  LOLContactsListViewController.m
//  Contacts
//
//  Created by Rafael França on 13/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import "LOLContactsListViewController.h"
#import "LOLContactFormViewController.h"

@implementation LOLContactsListViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Contacts";
        
        UIBarButtonItem *createContactButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showContactForm)];
        self.navigationItem.rightBarButtonItem = createContactButton;
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    LOLContact *contact = self.contacts[indexPath.row];

    cell.textLabel.text = contact.name;

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contacts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    }
}

- (void)showContactForm
{
    LOLContactFormViewController *form = [LOLContactFormViewController new];
    form.contacts = self.contacts;
    
    [self.navigationController pushViewController:form animated:YES];
}

@end
