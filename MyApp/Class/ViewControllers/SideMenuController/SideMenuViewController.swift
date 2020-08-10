//
//  SideMenuViewController.swift
//  MyApp
//
//  Created by admin on 8/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SideMenuSwift

enum SideMenuType : String {
    case home = "Home"
    case news = "News"
    case products = "Products"
    
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage.init(named: "icons8-home-24")
        case .news:
            return UIImage.init(named: "icons8-edit-24")
        case .products:
            return UIImage.init(named: "icons8-lightning-bolt-24")
        }
    }
}

class SideMenuViewController: UIViewController {
    let menuItems : [SideMenuType] = [.home, .news, .products]
    
    @IBOutlet weak var mySideMenu: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySideMenu.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let nib = UINib.init(nibName: "SideMenuTableViewCell", bundle: nil)
        mySideMenu.register(nib, forCellReuseIdentifier: "SideMenuTableViewCell")
        
    }

}
extension SideMenuViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
//        cell.closure = { [unowned self] menuType in
//            
//        }
        cell.menuType = menuItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // tim ra home . sau call chuyen man hình.
        // get ra topview
        //slimenucontroller.content
        //tabbar.
        
        let viewController = UIApplication.shared.keyWindow!.rootViewController
        if let slide = viewController as? SideMenuController {
            if let tabbar =  slide.contentViewController as? TabbarViewController {
                tabbar.selectedIndex = indexPath.row
            }
        }
    }
    
}
//lay ra top view
//extension UIWindow {
//    func topViewController() -> UIViewController? {
//        var top = rootViewController
//        while true {
//            if let presented = top?.presentedViewController {
//                top = presented
//            } else if let nav = top as? UINavigationController {
//                top = nav.visibleViewController
//            } else if let tab = top as? UITabBarController {
//                top = tab.selectedViewController
//            } else {
//                break
//            }
//        }
//        return top
//    }
//}
