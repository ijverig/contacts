//
//  LOLContactFormViewController.m
//  Contacts
//
//  Created by Rafael França on 12/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import "LOLContactFormViewController.h"
#import "LOLContact.h"

@interface LOLContactFormViewController ()

@end

@implementation LOLContactFormViewController

- (id)init
{
    self = [super init];
    if (self) {
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(createContact)];
        self.navigationItem.rightBarButtonItem = addButton;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createContact
{
    [self.contacts addObject:[self fetchDataFromForm]];
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (LOLContact *)fetchDataFromForm
{
    LOLContact *contact = [LOLContact new];
    
    contact.name = self.nameField.text;
    contact.email = self.emailField.text;
    contact.address = self.addressField.text;
    contact.phone = self.phoneField.text;
    contact.site = self.siteField.text;
    
    return contact;
}

@end
