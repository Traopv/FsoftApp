//
//  BaseViewController.swift
//  TechFest
//
//  Created by Charles on 10/19/17.
//  Copyright © 2017 Charles. All rights reserved.
//

import UIKit
import PullToRefreshSwift
//import Firebase

class BaseViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let baseColor : UIColor = VTBase.baseColor()
    let baseBackgroundColor : UIColor = VTBase.baseBackgroundColor()
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppManager.shared.currentViewController = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.isStatusBarHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("class name : \(self.theClassName)")
//        Analytics.logEvent("Screen \(self.theClassName)", parameters: nil)
//        Analytics.logEvent("Màn hình", parameters: [
//            "name": self.theClassName as NSObject,
//            "full_text": "" as NSObject
//            ])
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configUI(){
        
    }
    
    // MARK: navigation bar button item
    func showButtonMenu(){
        //self.addLeftBarButtonWithImage(R.image.menu()!)
    }
    func showButtonBack(){
        //let leftButton: UIBarButtonItem = UIBarButtonItem(image: R.image.back(), style: UIBarButtonItemStyle.done, target: self, action: "back")
        //navigationItem.leftBarButtonItem = leftButton;
    }
    func backPress(){
        navigationController?.popViewController(animated: true)
    }
    func showMenu(){
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.showMenu()
    }
   
    //MARK: show Alert
    func showAlert(message : String){
        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Đóng", style: .default, handler: {handler in
            return
        }))
        AppManager.shared.currentViewController!.present(alert, animated: true, completion: nil)
    }
    //MARK : NOTIFICATION
    func postNotification(vtName : String, vtObject: Any?, vtUserInfo: [AnyHashable : Any]?){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: vtName), object: vtObject, userInfo: vtUserInfo)
    }
    func postNotification(vtName : String, vtObject: Any?){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: vtName), object: vtObject)
    }
}

//








