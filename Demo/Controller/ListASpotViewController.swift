//
//  BookASpotViewController.swift
//  Demo
//
//  Created by ty on on 3/22/18.
//  Copyright © 2018 vanra. All rights reserved.
//

import UIKit

class ListASpotViewController: UIViewController {
    var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if self.revealViewController() != nil{
            self.navigationItem.title = "List a Spot"
            self.setupMenuGestureRecognizer()
            self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage.init(named: "menu"), style: .plain, target: self.revealViewController, action: #selector(self.revealViewController().revealToggle(_:))), animated: true)
        }
        addLabel()
      
    }
    func addLabel(){
        label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.text = "List A Spot"
        label.textAlignment = .center
        label.font = label.font.withSize(22)
        label.textColor = .black
        self.view.addSubview(label)
        label.center(in: self.view)
    }
  
    



}
