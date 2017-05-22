//
//  Contact.m
//  ContactApp
//
//  Created by Aditya Kumar on 10/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Contact.h"

#define kKeyForPhoneValue   @"value"
#define kKeyForPhoneNumber  @"digits"

@implementation Contact

- (instancetype) initContactWithContact:(CNContact *) contact
{
    self = [super init];
    self.firstName      = contact.givenName;
    self.middleName     = contact.middleName;
    self.lastName       = contact.familyName;
    self.fullName       = [NSString stringWithFormat:@"%@ %@ %@",self.firstName,self.middleName,self.lastName];
    self.phoneNumbers   = [[contact.phoneNumbers valueForKey:kKeyForPhoneValue] valueForKey:kKeyForPhoneNumber];
    return self;
}

@end
