//
//  LOLContactsListViewController.m
//  Contacts
//
//  Created by ios4609 on 13/08/14.
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

- (void)showContactForm
{
    LOLContactFormViewController *form = [LOLContactFormViewController new];
    [self.navigationController pushViewController:form animated:YES];
}

@end
