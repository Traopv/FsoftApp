//
//  HomeViewController.swift
//  MyApp
//
//  Created by admin on 7/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var myTableHome: UITableView!
    
    var homeCates : NSMutableArray = NSMutableArray()
    //list có phân trang
    var page : Int = 0
    var pageSize : Int = 20
    var canLoadMore : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // gọi hàm để load lại toàn bộ dữ liệu table
        self.myTableHome.addPullToRefresh{
            self.refreshData()
        }
        myTableHome.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let nib = UINib.init(nibName: "HomeTableViewCell", bundle: nil)
        myTableHome.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        loadData()
    }
    
    override func configUI() {
        super.configUI()
    }
    
    //load data table
    func loadData(){
        //hiển thị loading
        VTBase.showLoading()
        HAPI.requestGetCateByPage(page: page, pageSize: pageSize, completion: {(dict) in
            VTBase.hideLoading()
            self.canLoadMore = false
            if let arr = dict.object(forKey: "data") as? [NSDictionary]
            {
                print("==> cates: ", arr)
                if arr.count > 0 {
                    self.homeCates.addObjects(from: arr)
                    self.myTableHome.reloadData()
                    if arr.count > self.pageSize{
                        self.canLoadMore = true
                    }
                }
            }
        }) {(error) in
            VTBase.hideLoading()
        }
    }
    // refreshData table
    func refreshData(){
        page = 0
        pageSize = 20
        canLoadMore = true
        homeCates.removeAllObjects()
        myTableHome.reloadData()
        loadData()
        UIView.animate(withDuration: 0.1){
            self.myTableHome.pullToRefreshView.stopAnimating()
        }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeCates.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.lbTitle.text = ""
        if let dict  = homeCates.object(at: indexPath.row) as? NSDictionary{
            if let name = dict.object(forKey: "name") as? String{
                cell.lbTitle.text = name
            }
            if let imageUrl = dict.object(forKey: "icon") as? String{
                cell.imgCell?.setImageWithUrl(urlString: imageUrl)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tabBarController?.tabBar.isHidden = true
        let DetailHomeVc = DetailHomeViewController.init()
        self.navigationController?.pushViewController(DetailHomeVc, animated: true)
    }
    // load page table
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section > 0{
            let lastElement = homeCates.count - 1
            if indexPath.row == lastElement{
                if self.canLoadMore{
                    page += 1
                    self.loadData()
                }
            }
        }
    }
}
