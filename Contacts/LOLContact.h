//
//  LOLContact.h
//  Contacts
//
//  Created by Rafael França on 12/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LOLContact : NSManagedObject <NSCoding, MKAnnotation>

@property (strong) NSString *name;
@property (strong) NSString *email;
@property (strong) NSString *address;
@property (strong) NSString *phone;
@property (strong) NSString *site;
@property (strong) UIImage *photo;
@property (strong) NSNumber *latitude;
@property (strong) NSNumber *longitude;

@end
