//
//  TableViewHeaderFooterView.swift
//  SwiftDemo
//
//  Created by RWN on 2019/8/22.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

class TableViewHeaderFooterView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
