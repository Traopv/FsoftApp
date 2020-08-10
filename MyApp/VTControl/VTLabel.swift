//
//  VTLabel.swift
//  Swift_SMS2016
//
//  Created by Bluesea on 2/24/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit

class VTLabel: UILabel {
    var fontSize : CGFloat = 0.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func fontDefault(){
        self.font = UIFont(name: "UVNVanBold", size: (self.font?.pointSize)!)
    }
    func setupFontSize(_ mFontSize : CGFloat){
        self.fontSize = mFontSize
        self.font = UIFont(name: (self.font?.fontName)!, size: mFontSize)
    }
}
