//
//  RWNTableViewCell.m
//  UITableVIewConfig
//
//  Created by RWN on 2019/8/19.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import "RWNTableViewCell.h"
#import "RWNCellConfig.h"
#import "TestModel.h"

@interface RWNTableViewCell ()<RWNCellProtocol>

@end

@implementation RWNTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)rwn_setCellConfig:(RWNCellConfig *)config{
    
    id obj = config.model;
    if ([obj isMemberOfClass:[TestModel class]]) {
        TestModel * model = (TestModel *)obj;
        self.textLabel.text = model.name;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
