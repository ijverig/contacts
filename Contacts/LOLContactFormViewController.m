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

- (id)initWithContact:(LOLContact *)contact
{
    self = [super init];
    if (self) {
        self.contact = contact;
        
        UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(updateContact)];
        self.navigationItem.rightBarButtonItem = saveButton;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.contact) {
        self.nameField.text = self.contact.name;
        self.emailField.text = self.contact.email;
        self.addressField.text = self.contact.address;
        self.phoneField.text = self.contact.phone;
        self.siteField.text = self.contact.site;
        if (self.contact.photo) {
            [self.photoField setBackgroundImage:self.contact.photo forState:UIControlStateNormal];
        [   self.photoField setTitle:@"" forState:UIControlStateNormal];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createContact
{
    [self fetchDataFromForm];
    
    if (self.delegate) {
        [self.delegate contactAdded:self.contact];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateContact {
    [self fetchDataFromForm];
    
    if (self.delegate) {
        [self.delegate contactUpdated:self.contact];
    }

    [self.navigationController popViewControllerAnimated:YES];
}


- (void)fetchDataFromForm
{
    if (!self.contact) {
        self.contact = [LOLContact new];
    }
    
    self.contact.name = self.nameField.text;
    self.contact.email = self.emailField.text;
    self.contact.address = self.addressField.text;
    self.contact.phone = self.phoneField.text;
    self.contact.site = self.siteField.text;
    self.contact.photo = [self.photoField backgroundImageForState:UIControlStateNormal];
}

- (IBAction)selectPhoto:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
    } else {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    [self.photoField setBackgroundImage:image forState:UIControlStateNormal];
    [self.photoField setTitle:@"" forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
