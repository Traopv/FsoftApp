//
//  productCateId.swift
//  MyApp
//
//  Created by admin on 8/10/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class productCateId: UICollectionViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbLevel: UILabel!
    @IBOutlet weak var lbMeterial: UILabel!
    @IBOutlet weak var imgDisplay: UIImageView!
    @IBOutlet weak var lbTitleDis: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        conFig()
    }
    func conFig() {
        viewCell.layer.cornerRadius = 5
        viewCell.clipsToBounds = true
        viewCell.layer.masksToBounds = true
        viewCell.layer.shadowRadius = 5
        viewCell.layer.shadowOpacity = 0.5
        viewCell.layer.shadowOffset = CGSize(width: 3, height: 0)
        viewCell.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
//        imageCell.layer.cornerRadius = 10
//        imageCell.clipsToBounds = true
//        viewCell.layer.masksToBounds = true
        
        //bo tròn ảnh
        imgDisplay.layer.cornerRadius = imgDisplay.frame.height / 2
        imgDisplay.clipsToBounds = true
    }
}
