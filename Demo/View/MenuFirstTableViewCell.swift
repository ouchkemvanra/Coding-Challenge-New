//
//  MenuFirstTableViewCell.swift
//  Demo
//
//  Created by ty on on 3/21/18.
//  Copyright © 2018 vanra. All rights reserved.
//

import UIKit
import AlamofireImage

class MenuFirstTableViewCell: UITableViewCell {
//    var userProfileImage: UIImageView!
//    var userName: UILabel!
//    var ratingStarText: UILabel!
//    var ratingStarIcon: UIImageView!
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var ratingStarText: UILabel!
    @IBOutlet weak var ratingStarIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.init(red: 0/255, green: 46/255, blue: 99/255, alpha: 1)
        
    }
    

    
    //MARK: Set Data for View
    func setData(){
        let userImageURL = "https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/18157027_1387579324639169_3978796641263566916_n.jpg?oh=59e379317e9b9f50c7dd979cb5f77b72&oe=59E6BC37"
        let circleFilter = CircleFilter()
        self.userProfileImage.af_setImage(withURL: URL.init(string: userImageURL)!, placeholderImage: UIImage.init(named: "userProfilePlaceHolder"), filter: circleFilter, runImageTransitionIfCached: true, completion: nil)
        self.userName.text = "Hello Sammer!"
        self.ratingStarText.text = "5.0"
        
       
    }
    
    

    
}
