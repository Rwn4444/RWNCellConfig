//
//  RWNCellConfig.h
//  UITableVIewConfig
//
//  Created by RWN on 2019/8/19.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RWNCellConfig;

@protocol RWNCellProtocol <NSObject>

-(void)rwn_setCellConfig:(RWNCellConfig *)config;


@end


NS_ASSUME_NONNULL_BEGIN

@interface RWNCellConfig : NSObject

///cell的名字
@property (nonatomic, strong) Class<RWNCellProtocol> cellName;
///cell的数据
@property (nonatomic, strong) id  model;
///组头高
@property (nonatomic, assign) CGFloat  sectionHeaderHeight;
///组头高
@property (nonatomic, assign) CGFloat  sectionFooterHeight;
///header的名字
@property (nonatomic, strong) Class sectionHeaderName;
///footer的名字
@property (nonatomic, strong) Class sectionFooterName;


@end

NS_ASSUME_NONNULL_END
