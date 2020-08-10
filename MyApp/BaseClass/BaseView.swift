//
//  BaseView.swift
//  Swift_SMS2016
//
//  Created by Pham Van Trong on 1/29/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit
//import Firebase
class BaseView: UIView {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    override func didMoveToWindow() {
//        super.didMoveToWindow()
//        print("class name : \(self.theClassName)")
//        Analytics.logEvent("Screen \(self.theClassName)", parameters: nil)
//    }
    
    required init(coder aDecoder: NSCoder) {   // 2 - storyboard initializer
        super.init(coder: aDecoder)!
    }
    init() {   // 3 - programmatic initializer
        super.init(frame: CGRect())  // 4.
    }
    
    init(nibName : String, index : Int! = 0){
        super.init(frame: CGRect())  // 4.
    }

    func addBehavior (){
//        print("Add all the behavior here")
    }
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    func configViewUI()
    {
        
    }
    //MARK : NOTIFICATION
    func postNotification(vtName : String, vtObject: Any?, vtUserInfo: [AnyHashable : Any]?){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: vtName), object: vtObject, userInfo: vtUserInfo)
    }
    func postNotification(vtName : String, vtObject: Any?){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: vtName), object: vtObject)
    }


}//end class
