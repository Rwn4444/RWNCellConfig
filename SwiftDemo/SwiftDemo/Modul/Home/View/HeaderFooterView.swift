//
//  HeaderFooterView.swift
//  SwiftDemo
//
//  Created by RWN on 2019/8/22.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

class HeaderFooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
