//
//  VTButton.swift
//  Swift_SMS2016
//
//  Created by Bluesea on 2/24/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit

class VTButton: UIButton {
    var textTitle : String = ""
    var fontTitle : UIFont!
    
   override func draw(_ rect: CGRect) {
        awakeFromNib()
        super.draw(rect)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 3
    }
    
    func setupTextTitle(_ strTitle : String){
        self.textTitle = strTitle
        setTitle(strTitle, for: UIControl.State())
    }
    func setupFontTitle(_ mfontTitle : UIFont){
        self.fontTitle = mfontTitle
        self.titleLabel?.font = self.fontTitle
    }
}
