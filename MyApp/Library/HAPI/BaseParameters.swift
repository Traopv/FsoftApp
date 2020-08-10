//
//  Parameters.swift
//  MyApp
//
//  Created by ELSAGA-MACOS on 8/8/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation


class BaseParameters {
    
    class func getLoginByUserNameParam(userName : String, password : String) -> String{
//        return [
//            "userName"  : userName,
//            "password"      : password
//        ]
        return "?userName=\(userName)&password=\(password)"
    }
    class func getCatesParam(page: Int, pageSize: Int) -> String{
        return "?page=\(page)&pageSize=\(pageSize)"
    }
    class func getProductByCateIdParam(cateId: String, page: Int, pageSize: Int) -> String{
        return "?cateId=\(cateId)&page=\(page)&pageSize=\(pageSize)"
    }
}
