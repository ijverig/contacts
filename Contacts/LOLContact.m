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

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.site forKey:@"site"];
    [aCoder encodeObject:self.photo forKey:@"photo"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.site = [aDecoder decodeObjectForKey:@"site"];
        self.photo = [aDecoder decodeObjectForKey:@"photo"];
        self.latitude = [aDecoder decodeObjectForKey:@"latitude"];
        self.longitude = [aDecoder decodeObjectForKey:@"longitude"];
    }
    return self;
}

@end
