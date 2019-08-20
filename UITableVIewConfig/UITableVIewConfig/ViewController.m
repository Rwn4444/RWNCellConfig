//
//  ViewController.m
//  UITableVIewConfig
//
//  Created by RWN on 2019/8/19.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "RWNCellConfig.h"
#import "RWNTableViewCell.h"
#import "NormalHeaderFooterView.h"
#import "HeaderFooterView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)setUI{
    
    NSMutableArray * dataArray = [NSMutableArray array];
    ///生成数据
    for (int i = 0; i < 50; i++) {
        TestModel * model = [[TestModel alloc] init];
        model.name = [NSString stringWithFormat:@"%d",i];
        [dataArray addObject:model];
    }
    
    NSMutableArray * configs  = [NSMutableArray array];
    for (TestModel * model  in dataArray) {
        RWNCellConfig * config = [[RWNCellConfig alloc] init];
        config.cellName = RWNTableViewCell.self;
        config.model = model;
        config.sectionHeaderHeight = 50;
        config.sectionFooterHeight = 80;
        config.sectionHeaderName = HeaderFooterView.self;
        config.sectionFooterName = HeaderFooterView.self;

        [configs addObject:config];
    }
    self.configs = @[configs];
    [self.tableView reloadData];
    
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    return 5;
//    
//}
//
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"456"];
//    cell.backgroundColor = [UIColor yellowColor];
//    return cell;
//    
//}


@end
