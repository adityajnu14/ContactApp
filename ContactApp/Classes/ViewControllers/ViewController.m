//
//  ViewController.m
//  ContactApp
//
//  Created by Aditya Kumar on 10/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"



#define kContactCellIdentifier  @"ContactCell"

@interface ViewController ()
{
    NSMutableArray* _contactData;
}
@end

@implementation ViewController

#pragma mark - Life cycle method

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getAllContact];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Private method

-(void) getAllContact
{
    NSMutableArray* contacts = [[NSMutableArray alloc] init];
    if([CNContactStore class])
    {
        CNContactStore* contactStoredData = [[CNContactStore alloc] init];
        NSArray* keyToFetch = @[CNContactFamilyNameKey,
                                CNContactGivenNameKey,
                                CNContactMiddleNameKey,
                                CNContactPhoneNumbersKey];
        CNContactFetchRequest* fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:keyToFetch];
        [contactStoredData enumerateContactsWithFetchRequest:fetchRequest error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop){
            [contacts addObject:contact];
        }];
        [self savePhoneNumbers:contacts];
    }
}

- (void) savePhoneNumbers:(NSArray*) contacts
{
    _contactData = [[NSMutableArray alloc] init];
    for(CNContact* contact in contacts)
    {
        Contact* aContact = [[Contact alloc] initContactWithContact:contact];
        [_contactData addObject:aContact];
    }
    [self.contactListTableView reloadData];
}

- (NSString*) getAllPhoneNumberFor:(NSInteger) index
{
    NSMutableString* numbersString = [NSMutableString string];
    NSArray* numbersArray = [(Contact*)_contactData[index] phoneNumbers];
    for(NSString* number in numbersArray)
        [numbersString appendFormat:@"%@ ",number];
    return numbersString;
}

#pragma mark - UITableViewDataSource method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return _contactData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kContactCellIdentifier];
    if(cell == nil)
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kContactCellIdentifier];
    cell.textLabel.text = [(Contact*)_contactData[indexPath.row] fullName];
    cell.detailTextLabel.text = [self getAllPhoneNumberFor:indexPath.row];
    return cell;
}

@end
