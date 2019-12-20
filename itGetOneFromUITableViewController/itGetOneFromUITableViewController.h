//
//  itGetOneFromUITableViewController.h
//  NULL
//
//  Created by foolsparadise on 19/12/2019.
//  Copyright © 2019 github.com/foolsparadise All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 ### itGetOneFromUITableViewController
 Demo for UITableViewController
 本文件只是一个有关 UITableViewController 的 Demo
 其实这种写法,不建议
 建议
 继承自UIViewController，并在里面实例化UITableView，并不会多增加多少代码
 但是可以避免很多问题
 比如加载子视图放在UIViewController根view上就不会有跟随滚动的问题，加载断网图，也不会出现盖不全的问题
 ### Usage:
 #import "itGetOneFromUITableViewController.h"
 <itGetOneFromUITableViewControllerDelegate>
 ```
 itGetOneFromUITableViewController *vc = [itGetOneFromUITableViewController new];
 vc.objectsArray = //(NSMutableArray *).mutableCopy;
 vc.delegate = self;
 [self.navigationController pushViewController:vc animated:YES];
 -(void)itGetOneFromUITableViewControllerDelegate:(BOOL)gotit atIndex:(NSInteger)index withObject:(id)object
 {
     NSLog(@"%d %ld %@", gotit, (long)index, object);
 }
 ```
 ### MIT
 */
NS_ASSUME_NONNULL_BEGIN

@protocol itGetOneFromUITableViewControllerDelegate <NSObject>

@optional
-(void)itGetOneFromUITableViewControllerDelegate:(BOOL)gotit atIndex:(NSInteger)index withObject:(id)object;

@end

@interface itGetOneFromUITableViewController : UITableViewController

@property (nonatomic, weak) id<itGetOneFromUITableViewControllerDelegate>delegate;

@property (nonatomic, strong) NSMutableArray *objectsArray;

@end

NS_ASSUME_NONNULL_END
