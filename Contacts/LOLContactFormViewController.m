//
//  LOLContactFormViewController.m
//  Contacts
//
//  Created by ios4609 on 12/08/14.
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
        self.contacts = [NSMutableArray new];
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

- (IBAction)createContact:(id)sender
{
    LOLContact *contact = [LOLContact new];
    contact.name = self.nameField.text;
    contact.email = self.emailField.text;
    contact.address = self.addressField.text;
    contact.phone = self.phoneField.text;
    contact.site = self.siteField.text;
    
    [self.contacts addObject:contact];
    
    NSLog(@"Actual contacts: %@", self.contacts);
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
