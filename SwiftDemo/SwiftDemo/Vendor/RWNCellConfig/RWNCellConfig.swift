//
//  RWNCellConfig.swift
//  SwiftDemo
//
//  Created by RWN on 2019/8/22.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

@objc protocol RWNCellProtocol {
    
    @objc func rwn_setCellConfig(config : RWNCellConfig)
    
}


class RWNCellConfig: NSObject {

    var cellName : AnyClass?
    var model :AnyObject?
    var sectionHeaderHeight : CGFloat?
    var sectionFooterHeight : CGFloat?
    var sectionHeaderName : AnyClass?
    var sectionFooterName : AnyClass?

    
    
}
