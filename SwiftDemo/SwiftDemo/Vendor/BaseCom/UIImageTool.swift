//
//  UIImageTool.swift
//  SwiftDemo
//
//  Created by RWN on 2019/8/21.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit


extension UIImage {
    
    class func imageWithColor(color:UIColor) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
    
}




