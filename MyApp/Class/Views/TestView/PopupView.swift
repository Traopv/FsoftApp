//
//  PopupView.swift
//  MyApp
//
//  Created by ELSAGA-MACOS on 8/8/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class PopupView: BaseView {

    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    
    
    @IBAction func closePopup(_ sender: Any) {
        KLCPopup.dismissAllPopups()
    }
    
    override func configViewUI() {
        super.configViewUI()
        self.vtSetCornerRadius(vtRadius: 5.0)
    }
    
}
