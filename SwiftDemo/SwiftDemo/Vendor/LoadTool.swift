//
//  LoadTool.swift
//  SwiftDemo
//
//  Created by RWN on 2019/8/21.
//  Copyright © 2019年 RWN. All rights reserved.
//

import Foundation
import UIKit
import SwiftyLoad

extension UINavigationController : NSSwiftyLoadProtocol {
    
    public static func swiftyLoad() {
        
        let navBarApper = UINavigationBar.appearance()
        navBarApper.isTranslucent = false
//        navBarApper.shadowImage = UIImage.imageWithColor(color: UIColor.white)
//        navBarApper.setBackgroundImage(UIImage.imageWithColor(color: UIColor.white), for: .default)
        navBarApper.titleTextAttributes = [.font :UIFont.boldSystemFont(ofSize: 18),.foregroundColor:UIColor.black]
        
    }
    
}

