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
        self.selectedLine = -1;
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

- (void)viewDidAppear:(BOOL)animated
{
    if (self.selectedLine >= 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.selectedLine inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        
        self.selectedLine = -1;
    }
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LOLContact *contact = self.contacts[indexPath.row];
    
    LOLContactFormViewController *form = [[LOLContactFormViewController alloc] initWithContact:contact];
    form.delegate = self;
    
    [self.navigationController pushViewController:form animated:YES];
}

- (void)showContactForm
{
    LOLContactFormViewController *form = [LOLContactFormViewController new];
    form.delegate = self;
    
    [self.navigationController pushViewController:form animated:YES];
}

- (void)contactAdded:(LOLContact *)contact
{
    [self.contacts addObject:contact];
    self.selectedLine = [self.contacts indexOfObject:contact];
}

- (void)contactUpdated:(LOLContact *)contact
{
    self.selectedLine = [self.contacts indexOfObject:contact];
}

@end
