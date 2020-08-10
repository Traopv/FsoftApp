//
//  UIView+Design.swift
//  MyApp
//
//  Created by admin on 7/30/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension UIView{
    func setRadiusAndShadow(){
        layer.cornerRadius = 5
        clipsToBounds = true
        layer.masksToBounds = true
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 0)
        layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }
}
