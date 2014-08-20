//
//  LOLContactFormViewController.h
//  Contacts
//
//  Created by Rafael França on 12/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOLContact.h"
#import "LOLContactFormViewControllerDelegate.h"

@interface LOLContactFormViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *siteField;
@property (weak, nonatomic) IBOutlet UIButton *photoField;

@property (strong) id<LOLContactFormViewControllerDelegate> delegate;
@property (strong) LOLContact *contact;

- (id) initWithContact:(LOLContact *)contact;
- (IBAction)selectPhoto:(id)sender;

@end
