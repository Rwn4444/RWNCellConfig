//
//  RWNTableViewCell.swift
//  SwiftDemo
//
//  Created by RWN on 2019/8/22.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

class RWNTableViewCell: UITableViewCell ,RWNCellProtocol {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.contentView.addSubview(leftLable)
//
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func rwn_setCellConfig(config: RWNCellConfig) {

        let model = config.model
        if model is TestModel {
            let  newModel = model as! TestModel
            self.textLabel?.text = newModel.name
        }
    }

//    lazy var  leftLable : UILabel = {
//        let leftLable = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
//        leftLable.textColor = UIColor.black
//        leftLable.backgroundColor = UIColor.yellow
//        return leftLable
//
//    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
