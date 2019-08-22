//
//  BaseViewController.swift
//  SwiftDemo
//
//  Created by RWN on 2019/8/21.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController{
    
    var currentPage : NSInteger = 1
    var tableViewStyle = UITableView.Style.grouped
    var frameType : NSInteger = 0
    var edgeInsets :UIEdgeInsets?
    var configs = [[RWNCellConfig]]()
    
    // MARK: ----life cycle ----
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        normalSet()
        setNav()
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = self.view.bounds
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    /// 初始化方法
    ///
    /// - Parameters:
    ///   - style: uitableview的stype
    ///   - frameType: 0:父类的大小 1:自定义大小
    ///   - edgeInsets: 自定义大小的frame
    init(style : UITableView.Style ,frameType:NSInteger,edgeInsets:UIEdgeInsets) {
        
        self.tableViewStyle = style
        self.frameType = frameType
        self.edgeInsets = edgeInsets
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: ---- Private ----
    func normalSet()  {
        
        self.view.backgroundColor = UIColor.white
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
    }
    
    
    func setNav()  {
        
    }
    
    func setUI()  {
        
    }
    
    // MARK: ---- Getter and Setter ----
    lazy var tableView : UITableView = {
        
        let tableView = UITableView(frame: .zero, style: self.tableViewStyle)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 40
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        
    }()
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK : tableview初始化
extension BaseViewController : UITableViewDelegate ,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return configs.isEmpty ?  1 : configs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if configs.isEmpty {return  0}
        let array = configs[section]
        return  array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let config = getConfigModel(section: indexPath.section, row: indexPath.row)
        let cellClassName = NSStringFromClass(config?.cellName ?? UITableViewCell.self)
        var cell  = tableView.dequeueReusableCell(withIdentifier: cellClassName)
        if cell == nil {
            let path = Bundle.main.path(forResource: cellClassName, ofType: "nib")
            if (path != nil) {
                tableView.register(UINib.init(nibName: cellClassName, bundle: nil), forCellReuseIdentifier: cellClassName)
            }else{
                tableView.register(config?.cellName, forCellReuseIdentifier: cellClassName)
            }
            cell  = tableView.dequeueReusableCell(withIdentifier: cellClassName)
        }

        
        if let newCell = cell , newCell.conforms(to: RWNCellProtocol.self) {
            let protocolCell = newCell as! RWNCellProtocol
            protocolCell.rwn_setCellConfig(config: config ?? RWNCellConfig())
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let config =  getConfigModel(section: section, row: 0)
        return  config?.sectionHeaderHeight ?? .leastNormalMagnitude
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let config =  getConfigModel(section: section, row: 0)
        return  config?.sectionFooterHeight ?? .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let uiview =  self.getHeaderFooterView(section: section, headerView: true)
        return uiview
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.getHeaderFooterView(section: section, headerView: false)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func getHeaderFooterView(section : NSInteger , headerView : Bool ) -> UIView {
        
        let config =  getConfigModel(section: section, row: 0)
        let height = headerView ? config?.sectionHeaderHeight : config?.sectionFooterHeight
        var  headerFooterView = UIView(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.size.width , height: height ?? 0))
        guard let newConfit = config else {
            return headerFooterView
        }
        let cellClassName = headerView ? NSStringFromClass(config?.sectionHeaderName ?? UITableViewCell.self) :NSStringFromClass(config?.sectionFooterName ?? UITableViewCell.self)
        if  newConfit.cellName == UITableViewHeaderFooterView.self  {
            headerFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: cellClassName) ?? UIView()
            if headerFooterView.isKind(of: UIView.self) {
                let path = Bundle.main.path(forResource: cellClassName, ofType: "nib")
                if (path != nil) {
                    tableView.register(UINib.init(nibName: cellClassName, bundle: nil), forHeaderFooterViewReuseIdentifier: cellClassName)
                }else{
                    tableView.register(config?.cellName, forHeaderFooterViewReuseIdentifier: cellClassName)
                }
            }
            
        }else{
            let normalView = NSClassFromString(cellClassName) as! UIView.Type
            headerFooterView = normalView.init(frame:headerFooterView.bounds)
        }
        return headerFooterView
    }
    
    
    func getConfigModel(section : NSInteger , row : NSInteger) -> RWNCellConfig? {
        if configs.isEmpty {return  nil }
        let array = configs[section]
        if array.isEmpty { return nil }
        let config = array[row]
        return config
    }
    
    
}



