//
//  MenuListTableViewCell.swift
//  Demo
//
//  Created by ty on on 3/21/18.
//  Copyright © 2018 vanra. All rights reserved.
//

import UIKit

class MenuListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuListIcon: UIImageView!
    @IBOutlet weak var menuListTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    //MARK: Set Data
    func setData(title: String, icon: UIImage){
        self.menuListTitle.text = title
        self.menuListIcon.image = icon
    }
    
}
