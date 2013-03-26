//
//  ViewController.m
//  tableViewPractice
//
//  Created by Lalo on 04/03/2013.
//  Copyright (c) 2013 Lalo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTableView, myTableController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.    
    myTableController = [[MyTableViewController alloc] init];
    myTableView.delegate = myTableController;
    myTableView.dataSource = myTableController;
    myTableController.view = myTableController.tableView;
}

@end
