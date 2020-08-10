//
//  LoginViewController.swift
//  MyApp
//
//  Created by admin on 7/30/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SideMenuSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginFaceButton: UIButton!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var showPassword: UIButton!
    
    var passIsSecurity : Bool = true
//    var phone : String = "123"
//    var password : String = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtPassword.isSecureTextEntry = passIsSecurity
        let defaults = UserDefaults.standard
        txtPhone.text = defaults.string(forKey: AppManager.shared.userNameKey) ?? ""
        txtPassword.text = defaults.string(forKey: AppManager.shared.passwordKey) ?? ""
        
        loginView.setRadiusAndShadow()
        loginButton.designButton(borderWidth: 1, borderColor: #colorLiteral(red: 0.2754836494, green: 0.6420582018, blue: 1, alpha: 1))
        loginFaceButton.designButton(borderWidth: 1, borderColor: #colorLiteral(red: 0.2192853982, green: 0.4219668903, blue: 0.8158193005, alpha: 1))
    }
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func Login(_ sender: Any) {
        let userName = txtPhone.text ?? ""
        let password = txtPassword.text ?? ""
        if(userName.length == 0){
            VTBase.showToastWithMessage(message: "Vui lòng nhập tên đăng nhập")
            return
        }
        if(password.length == 0){
            VTBase.showToastWithMessage(message: "Vui lòng nhập mật khẩu")
            return
        }
        VTBase.showLoading()
        HAPI.requestLoginByUserName(userName: userName, password: password, completion: { (responseData) in
            print("login success: ", responseData)
            VTBase.hideLoading()
            if let data = responseData.object(forKey: "data") as? NSDictionary
            {
                if let token = data.object(forKey: "token") as? String
                {
                    AppManager.shared.authorToken = token
                }
                if let user = data.object(forKey: "user") as? NSDictionary
                {
                    AppManager.shared.userInfo = user
                }
            }
            //đăng nhập thành công thì lưu lại tên đăng nhập, mật khẩu để lần sau đỡ phải gõ
            let defaults = UserDefaults.standard
            defaults.set(userName, forKey: AppManager.shared.userNameKey)
            defaults.set(password, forKey: AppManager.shared.passwordKey)
            defaults.synchronize()
            //Go to home
            if let window = UIApplication.shared.windows.first {
                           let tabbarVC = TabbarViewController.init()
                           let menuVC = SideMenuViewController.init()
                           window.rootViewController = SideMenuController(contentViewController: tabbarVC, menuViewController: menuVC)
                       }
        }) { (error) in
            print("==> login error : ", error)
        }
    }
    @IBAction func LoginWithFacebook(_ sender: Any) {
//        let  popupView : PopupView = PopupView().fromNib(nibName: "PopupView", index: 0) as! PopupView
//        popupView.configViewUI()
//        let klc = KLCPopup.init(contentView: popupView)
//        klc?.showType = .bounceInFromLeft
//        klc?.dismissType = .bounceOutToTop
//        klc?.maskType = .dimmed
//        klc?.shouldDismissOnBackgroundTouch = true
//        klc?.show()
    }
    //MARK: Show password
    @IBAction func showPass(_ sender: Any) {
        passIsSecurity = !passIsSecurity
        
        if passIsSecurity{
            self.txtPassword.isSecureTextEntry = true
        } else {
            self.txtPassword.isSecureTextEntry = false
        }
        
    }
    
}
