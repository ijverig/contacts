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
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSString *message = [NSString stringWithFormat:@"Number of items: %d", [self.contacts count]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"List" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
    
}

- (void)showContactForm
{
    LOLContactFormViewController *form = [LOLContactFormViewController new];
    form.contacts = self.contacts;
    
    [self.navigationController pushViewController:form animated:YES];
}

@end
