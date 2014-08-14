//
//  LOLContactFormViewController.h
//  Contacts
//
//  Created by Rafael França on 12/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOLContact.h"

@interface LOLContactFormViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *siteField;

@property (weak, nonatomic) NSMutableArray *contacts;

@end
