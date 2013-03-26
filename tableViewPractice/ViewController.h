//
//  ViewController.h
//  tableViewPractice
//
//  Created by Lalo on 04/03/2013.
//  Copyright (c) 2013 Lalo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) MyTableViewController *myTableController;

@end
