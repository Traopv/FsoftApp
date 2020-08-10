//
//  UIButton+Design.swift
//  MyApp
//
//  Created by admin on 7/30/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension UIButton{
    func designButton(borderWidth: CGFloat = 1, borderColor: UIColor = #colorLiteral(red: 0.2754836494, green: 0.6420582018, blue: 1, alpha: 1)){
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
