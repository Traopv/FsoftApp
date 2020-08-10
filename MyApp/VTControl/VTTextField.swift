//
//  VTTextField.swift
//  LinxBooking
//
//  Created by Charlie on 4/12/17.
//  Copyright © 2017 Trong Pham Van. All rights reserved.
//

import UIKit

class VTTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK:
    func setPlaholderColor(color: UIColor){
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }

}
