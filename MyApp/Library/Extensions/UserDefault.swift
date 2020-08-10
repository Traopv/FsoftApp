//
//  UserDefault.swift
//  MyApp
//
//  Created by admin on 8/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

struct Default{
    static let (phoneKey,passKey) = ("phone","pass")
    static let userSessionKey = "com.save.usersesstion"
    private static let userDefault = UserDefaults.standard
    
    struct UserDetails {
        let phone: String
        let pass: String
        init(_ json: [String: String]) {
            self.phone = json[phoneKey] ?? ""
            self.pass = json[passKey] ?? ""
        }
    }
    //luu du lieu
    static func save(_ phone: String, pass: String){
        userDefault.set([phoneKey: phone, passKey: pass], forKey: userSessionKey)
    }
    // tim nap gia tri theo userDetails
    static func getPhoneAndPass() -> UserDetails{
        return UserDetails((userDefault.value(forKey: userSessionKey) as? [String: String] ?? [:]))
        
    }
    
}
