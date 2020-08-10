//
//  HAPI.swift
//  MyApp
//
//  Created by ELSAGA-MACOS on 8/8/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Alamofire

class HAPI : NSObject
{
//    static let shared = HAPI()
    static let baseURLString = "http://api.foodrecipe.host76.elsaga.net"
//    static let baseURLString = "http://192.168.1.22:5001"
    static var defaultHeader : HTTPHeaders = ["Authorization": "Bearer \(AppManager.shared.authorToken ?? "")"]
    
    static func requestLoginByUserName(userName : String, password : String, completion : @escaping (NSDictionary ) -> Void, failure : @escaping (Any) -> Void){
           print("HAPIClient : request login phone number")
        let path = HAPI.baseURLString + "/login/LoginByUserName"
        let param = BaseParameters.getLoginByUserNameParam(userName: userName, password: password)
        let mPath = path + param
        requestAPI(url: mPath, med: .get, param: [:], completion: { (dict) in
               completion(dict)
           }) { (error) in
               failure(error)
           }
       }
    static func requestGetCates(completion : @escaping (NSDictionary ) -> Void, failure : @escaping (Any) -> Void)
    {
        let path = HAPI.baseURLString + "/category/getAll"
        requestAPI(url: path, med: .get, param: [:], completion: { (dict) in
               completion(dict)
           }) { (error) in
               failure(error)
           }
    }
    //MARK: get cates with page and pageSize
    static func requestGetCateByPage(page: Int, pageSize: Int, completion : @escaping (NSDictionary) -> Void, failuer : @escaping (Any) -> Void){
        let path = HAPI.baseURLString + "/category/getCates"
        let param = BaseParameters.getCatesParam(page: page, pageSize: pageSize)
        let mPath = path + param
        requestAPI(url: mPath, med: .get, param: [:], completion: {(dict) in
           completion(dict)
        }, failure: {(error) in
            failuer(error)
        })
    }
    //MARK: get products with cateId, page and pageSize
    static func requestGetProductsByParam(cateId: String, page: Int, pageSize: Int, completion: @escaping (NSDictionary) -> Void, failuer : @escaping (Any) -> Void){
        let path = HAPI.baseURLString + "/product/getProducts"
        let param = BaseParameters.getProductByCateIdParam(cateId: cateId, page: page, pageSize: pageSize)
        let mPath = path + param
        requestAPI(url: mPath, med: .get, param: [:], completion: {(dict) in
            completion(dict)
        }) { (error) in
            failuer(error)
        }
    }
    /** ----------------------------BASE FUNCTION---------------------------- */
    //MARK: Check internet connection
    static func checkInternetConnection() -> Bool{
        if (NetworkReachabilityManager.init()?.isReachable)!{
            return true
        }else{
            return false
        }
    }
    
    //MARK: request API
        static func requestAPI(url : String , med : HTTPMethod, param : Parameters, completion : @escaping (NSDictionary ) -> Void, failure : @escaping (Any) -> Void){
            if checkInternetConnection() != true{
                VTBase.showToastWithMessage(message: "Vui lòng kiểm tra kết nối mạng")
                VTBase.hideLoading()
                return
            }//
            defaultHeader = [
                "Authorization":"Bearer \(AppManager.shared.authorToken ?? "")",
                "Content-Type": "application/json", "Accept" : "application/json",
            ]
            var encode : ParameterEncoding  = URLEncoding.default
            if med == .post{
                encode = JSONEncoding.default
            }
           
            AF.request(url, method: med, parameters: param, encoding: encode, headers: defaultHeader).responseJSON{ response in
                switch response.result {
                case .success:
                    guard  let dict = self.checkResponseData(response: response) else {
                        // nếu data ko phải là dictionary
                        print("lỗi: data không phải là dictionary")
                        return
                    }
                    completion(dict)
                case .failure(let error):
                    print(error)
//                    VTBase.showToastWithMessage(message: error.localizedDescription)
                    _ = checkResponseData(response: response)
                    failure(error)
                }
            }
        }
    //MARK: check data response
        static func checkResponseData(response : AFDataResponse<Any>) -> NSDictionary? {
            let code : Int = (response.response?.statusCode)!
            if code == 401 {
                //lỗi chưa đăng nhập hoặc phiên làm việc đã hết  hạn, hiện thông báo và đẩy ra trang đăng nhập để đăng nhập lại
                VTBase.showToastWithMessage(message: "Phiên đăng nhập đã hết hạn, vui lòng đăng nhập lại để tiếp tục sử dụng")
                let login = LoginViewController.init(nibName: "LoginViewController", bundle: nil)
                let nav : BaseNavigationController = BaseNavigationController(rootViewController: login)
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = nav
                VTBase.hideLoading()
                return nil
            }
            if code == 200 {
                guard  let dict = response.value as? NSDictionary else {
                    // nếu data ko phải là dictionary
                    return nil
                }
    //            return dict
                guard let status = dict.object(forKey: "code") as? Int32 else {
                    //không trả về biến status hoặc status sai định dạng
                    return nil
                }
                if (status == 0){
                    return dict
                }else{
                    if status == -2{
                        //ở đây server quy định code = -2 là bắt đăng nhập lại, có thể do phiên đăng nhập hết hạn hoặc ko có quyền gọi api này
                        let login = LoginViewController.init(nibName: "LoginViewController", bundle: nil)
                        let nav : BaseNavigationController = BaseNavigationController(rootViewController: login)
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = nav
                        return nil
                    }else if status == -5{
                        //code = -5 chưa quy định, chưa xử lý gì
                        return nil
                    }
                    else{
                        guard let strMessage = dict.object(forKey: "message") as? String else {
                            return nil
                        }
                        print("request error with message : \(strMessage)")
                        VTBase.hideLoading()
                        VTBase.showToastWithMessage(message: strMessage)
                        return nil
                    }
                }
            }else{
                if let JSON : NSDictionary = response.value as? NSDictionary{
                    if let strMessage : String = JSON.object(forKey: "message") as? String{
                        VTBase.showToastWithMessage(message: strMessage)
                    }
                }
                VTBase.hideLoading()
                return nil
            }
        }
}
