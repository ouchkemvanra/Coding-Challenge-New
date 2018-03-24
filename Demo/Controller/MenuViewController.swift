//
//  MenuViewController.swift
//  Demo
//
//  Created by ty on on 3/20/18.
//  Copyright © 2018 vanra. All rights reserved.
//

import UIKit
import TinyConstraints

class MenuViewController: UIViewController {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    //var tableView: UITableView!
    var presentRow = 0
    var presntSection = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tableView.separatorInset.left = UIScreen.main.bounds.width
       
       
    }
    
    
    //MARK: set up view for table view
//    func setupTableView(){
//        tableView = UITableView.init(frame: CGRect(x: 8, y: 8, width: UIScreen.main.bounds.width-8, height: UIScreen.main.bounds.height-8), style: .plain)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(MenuFirstTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MenuFirstTableViewCell.self))
//        tableView.register(MenuListTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MenuListTableViewCell.self))
//        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
//        tableView.separatorInset.left = UIScreen.main.bounds.size.width
//
//
//
//        tableView.separatorStyle = .singleLine
//        self.view.addSubview(tableView)
//
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.top(to: self.view, offset: 0, relation: .equal, isActive: true)
//        tableView.bottom(to: self.view, offset: 0, relation: .equal, isActive: true)
//        tableView.leading(to: self.view, offset: 0, relation: .equal, isActive: true)
//        tableView.width(self.view.frame.size.width - 75)
//
//
//    }

}

//MARK: UITableView Data Source
extension MenuViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 5
        case 3:
            return 3
        default:
            return 0
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier:"MenuTopCell") as! MenuFirstTableViewCell
            cell.setData()
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier:"MenuListCell") as! MenuListTableViewCell
            let title = menuListTitle[indexPath.section - 1][indexPath.row]
            let icon = menuListIcon[indexPath.section - 1][indexPath.row]
            cell.setData(title: title, icon: icon!)
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 120
        default:
            return 44
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView.init(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 2))
        footer.backgroundColor = .lightGray
        let nofooter = UIView.init(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 0))
        switch section {
        case 1,2:
            return footer
        default:
            return nofooter
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 1,2:
            return 1
        default:
            return 0
        }
    }
}

//MARK: UITableView Delegate Method
extension MenuViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            let revealviewcontroller = self.revealViewController()
            let row = indexPath.row
            let section = indexPath.section
            var newViewcontroller : UIViewController? = nil
            
            switch indexPath.section {
            case 0:
                newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
            case 1:
                switch indexPath.row {
                case 0:
                    let homepage : UIViewController = storyboard!.instantiateViewController(withIdentifier: "HomeViewController")
                    newViewcontroller = UINavigationController(rootViewController: homepage)
                    break
                case 1:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                case 2:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                default:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                    break
                }
            case 2:
                switch indexPath.row {
                case 0:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                case 1:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                case 2:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                case 3:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                case 4:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                default:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                    break
                }
            case 3:
                switch indexPath.row {
                case 0:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                case 1:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                case 2:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                default:
                    newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                    break
                }
            default:
                newViewcontroller = UINavigationController(rootViewController: ListASpotViewController())
                break
                
            }
            revealviewcontroller?.pushFrontViewController(newViewcontroller, animated: true)
            self.presntSection = section
            self.presentRow = row
            print(presentRow)
    }

}
