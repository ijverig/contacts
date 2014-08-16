//
//  LOLContactsListViewController.h
//  Contacts
//
//  Created by Rafael França on 13/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LOLContactFormViewControllerDelegate.h"

@interface LOLContactsListViewController : UITableViewController <LOLContactFormViewControllerDelegate>

@property (weak, nonatomic) NSMutableArray *contacts;

@end
