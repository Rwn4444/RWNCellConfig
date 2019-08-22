//
//  RWNTabBarController.swift
//  SwiftDemo
//
//  Created by RWN on 2019/8/21.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

class RWNTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         addChild()
         self.tabBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }
    

    func addChild()  {
        
        let home  = HomeController()
        let homeNav = BaseNavController(rootViewController: home)
        homeNav.title = "home"

        
        let mine  = MineController()
        let mineNav = BaseNavController(rootViewController: mine)
        mineNav.title = "mine"

        self.viewControllers = [homeNav,mineNav]
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
