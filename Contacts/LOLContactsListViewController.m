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

- (void)viewDidLoad
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showMoreActions:)];
    [self.tableView addGestureRecognizer:longPress];
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

-(void)showMoreActions:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gesture locationInView:self.tableView];
        NSIndexPath *index_path = [self.tableView indexPathForRowAtPoint:point];
        self.selectedContact = self.contacts[index_path.row];
        
        UIActionSheet *options = [[UIActionSheet alloc] initWithTitle:self.selectedContact.name delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Call", @"Send email", @"Open site", @"Open map", nil];
        [options showInView:self.view];
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self call];
            break;
        case 1:
            [self sendEmail];
            break;
        case 2:
            [self openSite];
            break;
        case 3:
            [self openMap];
            break;
        default:
            break;
    }
}

-(void)call
{
    UIDevice *device = [UIDevice currentDevice];
    
    if ([device.model isEqualToString:@"iPhone"]) {
        NSString *number = [NSString stringWithFormat:@"tel:%@", self.selectedContact.phone];
        [self openApplicationWithURL:number];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"It is not possible to make a call" message:@"This device is not an iPhone" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
}

-(void)sendEmail
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *sender = [MFMailComposeViewController new];
        [sender setToRecipients:@[self.selectedContact.email]];
        sender.mailComposeDelegate = self;
        [self presentViewController:sender animated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"It is not possible send email" message:@"There is no email account configured" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
}

-(void)openSite
{
    [self openApplicationWithURL:self.selectedContact.site];
}

-(void)openMap
{
    NSString *url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", self.selectedContact.address] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self openApplicationWithURL:url];
}

-(void)openApplicationWithURL:(NSString *)url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
