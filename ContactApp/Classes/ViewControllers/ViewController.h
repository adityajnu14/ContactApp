//
//  ViewController.h
//  ContactApp
//
//  Created by Aditya Kumar on 10/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Contacts/Contacts.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView* contactListTableView;

@end

