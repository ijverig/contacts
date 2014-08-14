//
//  LOLContact.m
//  Contacts
//
//  Created by Rafael França on 12/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import "LOLContact.h"

@implementation LOLContact

- (NSString *)description
{
    NSString *data = [NSString stringWithFormat:@"Name: %@ Email %@ Address: %@ Phone: %@ Site %@",
                      self.name, self.email, self.address, self.phone, self.site];
    
    return data;
}

@end
