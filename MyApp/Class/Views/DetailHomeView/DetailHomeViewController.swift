//
//  DetailHomeViewController.swift
//  MyApp
//
//  Created by admin on 8/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class DetailHomeViewController: UIViewController {

    @IBOutlet weak var imgHome: UIImageView!
    @IBOutlet weak var titleHome: UILabel!
    @IBOutlet weak var decriptionHome: UILabel!
    
    var sImage : String = ""
    var sTitle : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgHome.setImageWithUrl(urlString: sImage)
        titleHome.text = sTitle
        conFigUIBarButton()
    }
    
   fileprivate func conFigUIBarButton(){
       let button1 = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-long-arrow-left-24"), style: .plain, target: self, action: #selector(callBack))
        self.navigationItem.leftBarButtonItem = button1
    
    }
    @objc func callBack(){
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }

}
