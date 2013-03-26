//
//  MyCell.h
//  tableViewPractice
//
//  Created by Lalo on 04/03/2013.
//  Copyright (c) 2013 Lalo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *fecha;
@property (strong, nonatomic) IBOutlet UILabel *local;
@property (strong, nonatomic) IBOutlet UILabel *visitante;
@property (strong, nonatomic) IBOutlet UILabel *estadio;
@property (strong, nonatomic) IBOutlet UIImageView *imagenLocal;
@property (strong, nonatomic) IBOutlet UIImageView *imagenVisitante;
@property (strong, nonatomic) IBOutlet UITextView *myTextView;

@end
