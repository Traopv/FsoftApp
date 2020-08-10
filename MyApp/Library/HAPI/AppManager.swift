//
//  AppManager.swift
//  MyApp
//
//  Created by ELSAGA-MACOS on 8/8/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class AppManager : NSObject
{
    static let shared = AppManager()
    
    var userNameKey = "USERNAME"
    var passwordKey = "PASSWORD"
    var authorToken : String? = ""
    var userInfo : NSDictionary? = NSDictionary()
    var currentViewController : BaseViewController?
    let Locale_vi = Locale.init(identifier: "vi_VN")
    
    func getUserName() -> String
    {
        if let value = userInfo?.object(forKey: "userName") as? String{
            return value
        }else{
            return ""
        }
    }
    
    func getPhoneNumber() -> String
    {
        if let value = userInfo?.object(forKey: "phoneNumber") as? String{
            return value
        }else{
            return ""
        }
    }
    
}
