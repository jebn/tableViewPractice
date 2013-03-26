//
//  MyTableViewController.m
//  tableViewPractice
//
//  Created by Lalo on 23/03/2013.
//  Copyright (c) 2013 Lalo. All rights reserved./Users/User/Documents/iOS Class/tableViewPractice/tableViewPractice/MyTableViewController.m
//

#import "MyTableViewController.h"
#import "MyCell.h"	

@interface MyTableViewController ()

@end

@implementation MyTableViewController
int currentRow;

NSInteger height[5], textViewHeight[5];

@synthesize textLocal, textVisitor, textDate, textStadium, imageLocal, imageVisitor, imageStadium,color;

	
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentRow = -1;
    
    for (int i = 0; i< 5; i++) {
        height[i] = 150;
        textViewHeight[i] = 10+i*10;
    }
    
    textLocal=[[NSMutableArray alloc] init];
    [textLocal addObject:@"Manchester United"];
    [textLocal addObject:@"FC Barcelona"];
    [textLocal addObject:@"Bayern Munich"];
    [textLocal addObject:@"Juventus"];
    [textLocal addObject:@"Paris Saint Germain"];
    
    textVisitor=[[NSMutableArray alloc] init];
    [textVisitor addObject:@"Real Madrid"];
    [textVisitor addObject:@"AC Milan"];
    [textVisitor addObject:@"Arsenal FC"];
    [textVisitor addObject:@"Celtic"];
    [textVisitor addObject:@"Valencia CF"];
    
    textStadium=[[NSMutableArray alloc] init];
    [textStadium addObject:@"Old Trafford"];
    [textStadium addObject:@"Camp Nou"];
    [textStadium addObject:@"Allianz Arena"];
    [textStadium addObject:@"Juventus Stadium"];
    [textStadium addObject:@"Parc des Princes"];
    
    imageStadium=[[NSMutableArray alloc] init];
    [imageStadium addObject:@"stadium1.jpg"];
    [imageStadium addObject:@"stadium2.jpg"];
    [imageStadium addObject:@"stadium3.jpg"];
    [imageStadium addObject:@"stadium4.jpg"];
    [imageStadium addObject:@"stadium5.jpg"];

    textDate=[[NSMutableArray alloc] init];
    [textDate addObject:@"March 5"];
    [textDate addObject:@"March 12"];
    [textDate addObject:@"March 13"];
    [textDate addObject:@"March 6"];
    [textDate addObject:@"March 6"];
    
    imageLocal=[[NSMutableArray alloc] init];
    [imageLocal addObject:@"local1.png"];
    [imageLocal addObject:@"local2.png"];
    [imageLocal addObject:@"local3.png"];
    [imageLocal addObject:@"local4.png"];
    [imageLocal addObject:@"local5.png"];
    
    imageVisitor=[[NSMutableArray alloc] init];
    [imageVisitor addObject:@"visitante1.png"];
    [imageVisitor addObject:@"visitante2.png"];
    [imageVisitor addObject:@"visitante3.png"];
    [imageVisitor addObject:@"visitante4.png"];
    [imageVisitor addObject:@"visitante5.png"];
    
    color = [[NSMutableArray alloc] init];
    [color addObject:[UIColor redColor]];
    [color addObject:[UIColor blueColor]];
    [color addObject:[UIColor redColor]];
    [color addObject:[UIColor whiteColor]];
    [color addObject:[UIColor purpleColor]];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [textLocal count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell= [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.imagenLocal.image = [UIImage imageNamed:[imageLocal objectAtIndex:indexPath.row]];
    cell.imagenVisitante.image = [UIImage imageNamed:[imageVisitor objectAtIndex:indexPath.row]];
    
    if (currentRow == indexPath.row){
        cell.fecha.text = [textDate objectAtIndex:indexPath.row];
        cell.local.text = [textLocal objectAtIndex:indexPath.row];
        cell.visitante.text = [textVisitor objectAtIndex:indexPath.row];
        cell.estadio.text = [textStadium objectAtIndex:indexPath.row];
        //Background of the selected cell
        cell.contentView.backgroundColor = [color objectAtIndex:indexPath.row];//[UIColor colorWithPatternImage:[UIImage imageNamed:[imageStadium objectAtIndex:indexPath.row]]];

    }else{
        cell.fecha.text = @"";
        cell.local.text = @"";
        cell.visitante.text = @"";
        cell.estadio.text = @"";
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    [cell.myTextView setFrame:CGRectMake(cell.myTextView.frame.origin.x, cell.myTextView.frame.origin.y, cell.myTextView.contentSize.width, textViewHeight[indexPath.row])];
    
    cell.myTextView.delegate = self;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:currentRow inSection:indexPath.section];
    currentRow = [indexPath row];
    NSMutableArray *indexPaths = [NSMutableArray new];
    [indexPaths addObject:indexPath];
    if (![indexPath0 isEqual:indexPath]) {
        [indexPaths addObject:indexPath0];
    }
    //[tableView beginUpdates];
    [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationRight];
    //[tableView endUpdates];
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (currentRow == indexPath.row) {
        return height[currentRow];
    } else {
        return 100;
    }
}

- (void) refreshHeight:(UITableView *) tableView{
    
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    NSMutableArray *indexPaths = [NSMutableArray new];
    [indexPaths addObject:indexPath0];
    [tableView beginUpdates];
    
    [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    [tableView endUpdates];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"SI ya jala el return");
    height[currentRow] = [textField.text intValue];
    [self refreshHeight:self.tableView];
    [textField resignFirstResponder];
    return YES;
}

@end
