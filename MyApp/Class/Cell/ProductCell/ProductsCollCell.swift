//
//  ProductsCollCell.swift
//  MyApp
//
//  Created by ELSAGA-MACOS on 8/9/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProductsCollCell: UICollectionViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    var cateId: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
