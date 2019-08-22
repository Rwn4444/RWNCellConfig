//
//  HomeController.swift
//  SwiftDemo
//
//  Created by RWN on 2019/8/21.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit



class HomeController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func setNav() {
        self.title = "home"
    }
    
    
    override func setUI() {
        
        var testArray = [TestModel]()
        for  _ in 0...15 {
            let testModel = TestModel()
            testModel.name = "RWN"
            testArray.append(testModel)
        }
        
        var configs = [RWNCellConfig]()
        for model  in testArray {
            let config = RWNCellConfig()
            config.cellName = RWNTableViewCell.self
            config.model = model
            config.sectionHeaderHeight = 50
            config.sectionFooterHeight = 80
            //UIView
//            config.sectionHeaderName = HeaderFooterView.self
//            config.sectionFooterName = HeaderFooterView.self
            //UITableViewHeaderFooterView
            config.sectionHeaderName = TableViewHeaderFooterView.self
            config.sectionFooterName = TableViewHeaderFooterView.self
            configs.append(config)
        }
        self.configs = [configs]
        self.tableView.reloadData()
        
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
