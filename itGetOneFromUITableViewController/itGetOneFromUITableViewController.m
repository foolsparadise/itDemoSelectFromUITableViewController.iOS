//
//  itGetOneFromUITableViewController.m
//  NULL
//
//  Created by foolsparadise on 19/12/2019.
//  Copyright © 2019 github.com/foolsparadise All rights reserved.
//

#import "itGetOneFromUITableViewController.h"

//#import "Masonry.h"
//#import "CLObject.h"

@interface itGetOneFromUITableViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign)NSInteger selectedCellIndex;

@end

@implementation itGetOneFromUITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // set title
    self.title = @"[Click and Select One]";
    
    //返回上一级
    UIBarButtonItem *backFromMapButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(doButtonBack)];
    self.navigationItem.leftBarButtonItem = backFromMapButtonItem;
    //确定这个
    UIBarButtonItem *confirmButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(confirmButton)];
    self.navigationItem.rightBarButtonItem = confirmButtonItem;

    self.tableView = [UITableView new];
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"itGetOneFromUITableViewControllerCell"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView reloadData];
        
    if ([self.tableView respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) { // Adjust for iPad
        self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    
}
-(void)doButtonBack
{
    NSLog(@"");
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)confirmButton
{
    NSLog(@"");
    //大部分 delegate 方法都是@optional的。@optional的方法在调用之前要用-respondsToSelector:检查一下 delegate 对这个方法真正实现了没有
    if ([self.delegate respondsToSelector:@selector(itGetOneFromUITableViewControllerDelegate:atIndex:withObject:)]) {
        [self.delegate itGetOneFromUITableViewControllerDelegate:YES atIndex:self.selectedCellIndex withObject:[self.objectsArray objectAtIndex:self.selectedCellIndex]];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section ? @"section == 0" : @"section == 1";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.objectsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itGetOneFromUITableViewControllerCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    // Configure the cell...
    //cell.textLabel.text = ...
    //CLObject *obj = [self.objectsArray objectAtIndex:indexPath.row];
    //cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", obj.placeMark.name, obj.placeMark.thoroughfare];
    /**
     // only code no use
     UIButton *labelConfirm = [self drawConfirmBtn:@"确定" withTag:indexPath.row];
     [cell addSubview:labelConfirm];
     [labelConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        //...
     }];
     */
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedCellIndex = indexPath.row;
}

- (UIButton *)drawConfirmBtn:(NSString *)title withTag:(NSInteger)tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1;
    button.layer.cornerRadius = 10;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [button addTarget:self action:@selector(drawConfirmBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button;
}
- (void)drawConfirmBtnAction:(UIButton*)button
{
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
