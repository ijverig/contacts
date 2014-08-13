//
//  LOLContactFormViewController.m
//  Contacts
//
//  Created by ios4609 on 12/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import "LOLContactFormViewController.h"

@interface LOLContactFormViewController ()

@end

@implementation LOLContactFormViewController

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
    NSMutableDictionary *data = [NSMutableDictionary new];
    [data setObject:self.nameField.text forKey:@"name"];
    [data setObject:self.emailField.text forKey:@"email"];
    [data setObject:self.addressField.text forKey:@"address"];
    [data setObject:self.phoneField.text forKey:@"phone"];
    [data setObject:self.siteField.text forKey:@"site"];
    NSLog(@"Data %@", data);
}
@end
