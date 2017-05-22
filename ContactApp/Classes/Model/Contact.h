//
//  Contact.h
//  ContactApp
//
//  Created by Aditya Kumar on 10/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Contacts/Contacts.h>

@interface Contact : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* middleName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* fullName;
@property (strong, nonatomic) NSArray*  phoneNumbers;

- (instancetype) initContactWithContact:(CNContact*) contact;

@end
