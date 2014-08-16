//
//  LOLContactFormViewControllerDelegate.h
//  Contacts
//
//  Created by Rafael França on 15/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import "LOLContact.h"

@protocol LOLContactFormViewControllerDelegate <NSObject>

- (void)contactAdded:(LOLContact *)contact;
- (void)contactUpdated:(LOLContact *)contact;

@end
