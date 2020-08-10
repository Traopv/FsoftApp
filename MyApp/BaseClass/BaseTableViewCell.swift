//
//  BaseTableViewCell.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/22/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//
import UIKit

open class BaseTableViewCell : UITableViewCell {
    class var identifier: String { return NSStringFromClass(type(of: self) as! AnyClass) }
    let baseColor = VTBase.baseColor()
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
   
    open override func awakeFromNib() {
    }
    
    open func setup() {
    }
    
    open class func height() -> CGFloat {
        return 48
    }
    
    open func setData(_ data: Any?) {

    }
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.alpha = 0.4
        } else {
            self.alpha = 1.0
        }
    }
    // ignore the default handling
    override open func setSelected(_ selected: Bool, animated: Bool) {
    }
    func fromNib(nibName : String, index : Int! = 0) -> UITableViewCell {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UITableViewCell
        
        return nibView
    }
    //MARK : NOTIFICATION
    func postNotification(vtName : String, vtObject: Any?, vtUserInfo: [AnyHashable : Any]?){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: vtName), object: vtObject, userInfo: vtUserInfo)
    }
    func postNotification(vtName : String, vtObject: Any?){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: vtName), object: vtObject)
    }
}
extension NSObject {
    var theClassName: String {
        return NSStringFromClass(type(of: self))
    }
}
