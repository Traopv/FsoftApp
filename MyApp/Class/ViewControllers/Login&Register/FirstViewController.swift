//
//  FirstViewController.swift
//  MyApp
//
//  Created by admin on 7/30/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.designButton(borderWidth: 1, borderColor: #colorLiteral(red: 0.2754836494, green: 0.6420582018, blue: 1, alpha: 1))
        registerButton.designButton(borderWidth: 1, borderColor: #colorLiteral(red: 0.8158193005, green: 0.6477391615, blue: 0.1941662128, alpha: 1))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func loginClick(_ sender: Any) {
        let login = LoginViewController.init()
        self.navigationController?.pushViewController(login, animated: true)
    }
    @IBAction func registerClick(_ sender: Any) {
        let register = RegisterViewController.init()
        self.navigationController?.pushViewController(register, animated: true)
    }
    
}
