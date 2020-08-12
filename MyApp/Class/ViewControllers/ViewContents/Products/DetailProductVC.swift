//
//  DetailProductVC.swift
//  MyApp
//
//  Created by admin on 8/12/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

enum TypeDetails : String, CaseIterable {
    case header = "Header"
    case title  = "Title"
    case shopInfo = "ShopInfor"
    case ingredient = "Ingredient"
    case perform = "Perform"
    case comment = "Comment"
}

class DetailProductVC: UIViewController {
    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCell()
        // Do any additional setup after loading the view.
    }
    func setUpCell(){
        myTable.register(UINib.init(nibName: "HerderCell", bundle: nil), forCellReuseIdentifier: "HerderCell")
        myTable.register(UINib.init(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        myTable.register(UINib.init(nibName: "ShopInfo", bundle: nil), forCellReuseIdentifier: "ShopInfo")
        myTable.register(UINib.init(nibName: "IngredientCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
        myTable.register(UINib.init(nibName: "Perform", bundle: nil), forCellReuseIdentifier: "Perform")
        myTable.register(UINib.init(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")

    }
}
extension DetailProductVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TypeDetails.allCases.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = TypeDetails.allCases[indexPath.row]
        switch (type) {
        case .header:
            return 250
        case .title:
            return 100
        case .shopInfo:
            return 140
        case .ingredient:
            return 358
        case .perform:
            return 358
        case .comment:
            return 100
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = TypeDetails.allCases[indexPath.row]
        switch (type) {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HerderCell", for: indexPath) as! HerderCell
            return cell
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            return cell
        case .shopInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopInfo", for: indexPath) as! ShopInfo
            return cell
        case .ingredient:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
            return cell
        case .perform:
           let cell = tableView.dequeueReusableCell(withIdentifier: "Perform", for: indexPath) as! Perform
            return cell
        case .comment:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
            return cell
        }
    }
    
    
}
