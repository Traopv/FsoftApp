//
//  SideMenuTableViewCell.swift
//  MyApp
//
//  Created by admin on 8/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var iconSideMenu: UIImageView!
    @IBOutlet weak var titleSideMenu: UILabel!
    
    var menuType : SideMenuType = .home {
        didSet {
            setUpCell()
            
        }
    }
    
    //var closure : ((SideMenuType) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    @IBAction func cellClick(_ sender: Any) {
//        closure?(menuType)
//    }
    
    fileprivate func setUpCell(){
        self.iconSideMenu.image = menuType.image ?? UIImage()
        self.titleSideMenu.text = menuType.rawValue
    }
}
