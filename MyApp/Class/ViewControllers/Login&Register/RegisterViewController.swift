//
//  RegisterViewController.swift
//  MyApp
//
//  Created by admin on 7/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var viewRegister: UIView!
    @IBOutlet weak var rgisterButton: UIButton!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtRePass: UITextField!
    
    var passIsecurrity : Bool = true
    var rePassIsecurrity : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        viewRegister.setRadiusAndShadow()
        rgisterButton.designButton(borderWidth: 1, borderColor: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func register(_ sender: Any) {
        if txtPhone.text != nil && txtPass.text != nil && txtRePass.text != nil && txtPass.text == txtRePass.text{
            Default.save(txtPhone.text!, pass: txtPass.text!)
            let loginVC = LoginViewController.init()
            self.navigationController?.pushViewController(loginVC, animated: true)
        } else if txtPass.text != txtRePass.text {
            AlertView.instance.showAlert(title: "Failur", message: "Mật khẩu không khớp!", alertType: .failure)
        } else {
            AlertView.instance.showAlert(title: "Failur", message: "Yêu cầu nhập đầy đủ thông tin!", alertType: .failure)
        }
    }
    @IBAction func showPass(_ sender: Any) {
        passIsecurrity = !passIsecurrity
        if passIsecurrity {
            txtPass.isSecureTextEntry = true
        } else {
            txtPass.isSecureTextEntry = false
        }
    }
    @IBAction func showRePass(_ sender: Any) {
        rePassIsecurrity = !rePassIsecurrity
               if rePassIsecurrity {
                   txtPass.isSecureTextEntry = true
               } else {
                   txtPass.isSecureTextEntry = false
               }
    }
}
