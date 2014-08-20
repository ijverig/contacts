//
//  LOLContact.h
//  Contacts
//
//  Created by Rafael França on 12/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOLContact : NSObject <NSCoding>

@property (strong) NSString *name;
@property (strong) NSString *email;
@property (strong) NSString *address;
@property (strong) NSString *phone;
@property (strong) NSString *site;
@property (strong) UIImage *photo;

@end
