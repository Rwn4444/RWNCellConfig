//
//  BaseViewController.h
//  hunhuibaomu
//
//  Created by RWN on 17/3/23.
//  Copyright © 2017年 RWN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

///
@property(nonatomic,strong)UITableView *tableView;
//TableViewStyle
@property(nonatomic,assign)UITableViewStyle style;
///
@property(nonatomic,assign)NSInteger currentPage;

@property (nonatomic, strong) NSMutableArray *configs;

-(void)setNav;

-(void)setUI;



@end
