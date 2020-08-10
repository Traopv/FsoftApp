//
//  VTTextFieldExtension.swift
//  Wimo
//
//  Created by Charles on 11/29/17.
//  Copyright © 2017 Charles. All rights reserved.
//

import UIKit

extension UITextField{
    func setTextFieldPlahoderColor(color : UIColor?){
        if color != nil{
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
                                                            attributes: [NSAttributedString.Key.foregroundColor: color ?? .black])
        }else{
            return
        }
    }
}
