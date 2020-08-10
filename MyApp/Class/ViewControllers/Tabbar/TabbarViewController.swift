//
//  TabbarViewController.swift
//  MyApp
//
//  Created by admin on 7/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SideMenuSwift

class TabbarViewController: UITabBarController {
    
    let homeVC = HomeViewController.init()
    let newsVC = NewsViewController.init()
    let productsVC = ProductsViewController.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = setUpTabbar(vc: homeVC, title: "Home", image: #imageLiteral(resourceName: "icons8-home-24"))
        let nav1 = setUpTabbar(vc: newsVC, title: "News", image: #imageLiteral(resourceName: "icons8-edit-24"))
        let nav2 = setUpTabbar(vc: productsVC, title: "Product", image: #imageLiteral(resourceName: "icons8-lightning-bolt-24"))
        
        viewControllers = [nav,nav1,nav2]
        conFigSideMenu()
    }
    func conFigSideMenu() {
        SideMenuController.preferences.basic.menuWidth = 270
        SideMenuController.preferences.basic.statusBarBehavior = .hideOnMenu
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = false
        SideMenuController.preferences.basic.supportedOrientations = .portrait
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = true

    }
    
    fileprivate func setUpTabbar(vc: UIViewController, title: String, image: UIImage) -> UINavigationController{
        let button1 = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-24"), style: .plain, target: self, action: #selector(callSideMenu))
        vc.title = title
        vc.navigationItem.leftBarButtonItem = button1
        let navController = UINavigationController.init(rootViewController: vc)
        navController.title = title
        navController.tabBarItem.image = image
        return navController
    }
    @objc func callSideMenu(){
        self.sideMenuController?.revealMenu()
    }
}
