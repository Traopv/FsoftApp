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
    @IBOutlet weak var viewCell: UIView!
    
    var cateId: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        conFig()
    }
    func conFig(){
        viewCell.layer.cornerRadius = 5
        viewCell.clipsToBounds = true
        viewCell.layer.masksToBounds = true
        viewCell.layer.shadowRadius = 5
        viewCell.layer.shadowOpacity = 0.5
        viewCell.layer.shadowOffset = CGSize(width: 3, height: 0)
        viewCell.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }
}
