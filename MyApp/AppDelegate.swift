//
//  AppDelegate.swift
//  MyApp
//
//  Created by admin on 7/30/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SideMenuSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white

        let welcome = FirstViewController()
        let nav = UINavigationController(rootViewController: welcome)
        window?.rootViewController = nav


        window?.makeKeyAndVisible()
        return true
    }


}
