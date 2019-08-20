//
//  BaseViewController.m
//  hunhuibaomu
//
//  Created by RWN on 17/3/23.
//  Copyright © 2017年 RWN. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()


@end

@implementation BaseViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.currentPage = 1;
    self.style =UITableViewStyleGrouped;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    
    [self setNav];
    [self setUI];
    
   
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}
#pragma mark - Setup Methods
-(void)setNav{
    
}

-(void)setUI{
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.configs.count ? :1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray * array = self.configs[section];
    return array.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray * array = self.configs[indexPath.section];
    RWNCellConfig * config = array[indexPath.row];
    NSString *identifier = [self reuseIdentifierForCellConfig:config];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        ///注册cell
        NSString *path = [[NSBundle mainBundle] pathForResource:identifier ofType:@"nib"];
        if (path) {
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
        } else {
            [tableView registerClass:config.cellName forCellReuseIdentifier:identifier];
        }
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    }
    
    if ([cell conformsToProtocol:@protocol(RWNCellProtocol)]) {
        UITableView <RWNCellProtocol> * tempCell = (UITableView<RWNCellProtocol>*)cell;
        [tempCell rwn_setCellConfig:config];
    }
    return cell;
    
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    NSArray * array = self.configs[section];
    if (array.count<=0) {return CGFLOAT_MIN;}
    RWNCellConfig * config = array[0];
    return config.sectionFooterHeight ? : CGFLOAT_MIN ;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    NSArray * array = self.configs[section];
    if (array.count<=0) {return CGFLOAT_MIN;}
    RWNCellConfig * config = array[0];
    return config.sectionHeaderHeight ? : CGFLOAT_MIN ;

}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
   return  [self getHeaderFooterViewWithSection:section headerView:YES];
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return  [self getHeaderFooterViewWithSection:section headerView:NO];

}


-(UIView * )getHeaderFooterViewWithSection:(NSInteger)section headerView:(BOOL)headerView  {
    
    NSArray * array = self.configs[section];
    if (array.count<=0) {return [UIView new];}
    RWNCellConfig * config = array[0];
    UIView * headerFootView =nil;
    
    Class headerFooterClass = headerView ? config.sectionHeaderName : config.sectionFooterName;
    CGFloat height = headerView ? config.sectionHeaderHeight : config.sectionFooterHeight;

    if (headerFooterClass) {
        ///注册Header
        if ([headerFooterClass isKindOfClass:[UITableViewHeaderFooterView class]]) {
            NSString * headerFooterViewName = NSStringFromClass(headerFooterClass);
            headerFootView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterViewName];
            if (headerFootView == nil) {
                NSString *headerPath = [[NSBundle mainBundle] pathForResource:headerFooterViewName ofType:@"nib"];
                if (headerPath) {
                    [self.tableView registerNib:[UINib nibWithNibName:headerFooterViewName bundle:nil] forHeaderFooterViewReuseIdentifier:headerFooterViewName];
                }else{
                    [self.tableView registerClass:headerFooterClass forHeaderFooterViewReuseIdentifier:headerFooterViewName];
                }
            }
            headerFootView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterViewName];
        }else{
            headerFootView=  [[headerFooterClass alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height)];
        }
    }else{
        headerFootView = [UIView new];
    }
    return headerFootView;
    
}



#pragma mark ---- Privete ----
- (Class)validClassForCellConfig:(RWNCellConfig *)config {
    return config.cellName ? : UITableViewCell.self;
}

- (NSString *)reuseIdentifierForCellConfig:(RWNCellConfig*)config {
    return NSStringFromClass([self validClassForCellConfig:config]);
}


-(void)setConfigs:(NSMutableArray *)configs{
    _configs = configs;
}


-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:self.style];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor=[UIColor whiteColor];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        [self.view addSubview:_tableView];
    }
    return _tableView;
    
}

#pragma mark - Network Requests methods
#pragma mark - Fetched Data Processing
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
