//
//  MyTableViewController.h
//  tableViewPractice
//
//  Created by Lalo on 23/03/2013.
//  Copyright (c) 2013 Lalo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController <UITextViewDelegate>

@property (strong, nonatomic) NSMutableArray *textLocal;
@property (strong, nonatomic) NSMutableArray *textVisitor;
@property (strong, nonatomic) NSMutableArray *textStadium;
@property (strong, nonatomic) NSMutableArray *textDate;
@property (strong, nonatomic) NSMutableArray *imageLocal;
@property (strong, nonatomic) NSMutableArray *imageVisitor;
@property (strong, nonatomic) NSMutableArray *imageStadium;
@property (strong, nonatomic) NSMutableArray *color;

@end
