//
//  VTView.swift
//  Swift_SMS2016
//
//  Created by Bluesea on 2/24/16.
//  Copyright © 2016 abc. All rights reserved.
//

import UIKit

class VTView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 3
    }

}
