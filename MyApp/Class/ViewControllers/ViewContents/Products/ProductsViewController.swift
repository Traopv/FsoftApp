//
//  ProductsViewController.swift
//  MyApp
//
//  Created by admin on 7/31/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    @IBOutlet weak var myColection: UICollectionView!
    
    var page : Int = 0
    var pageSize : Int = 20
    var canLoadMore : Bool = true
    
    var productCates : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.myColection.addPullToRefresh(){
            self.refreshData()
        }
        
        myColection.register(UINib.init(nibName: "ProductsCollCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollCell")
        loadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //hien tabbar
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpCollectionViewItems()
    }
    func setUpCollectionViewItems(){
        if collectionViewFlowLayout == nil{
            let numberOfItemInRow : CGFloat = 3
            let iLineSpaing : CGFloat = 5
            let interItemSpacing : CGFloat = 5
            let iWidth = (myColection.frame.size.width - (numberOfItemInRow - 1) * interItemSpacing) / numberOfItemInRow
            let iHeight = iWidth
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: iWidth, height: iHeight)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = iLineSpaing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            myColection.setCollectionViewLayout(collectionViewFlowLayout, animated : true)
        }
    }
    func loadData(){
        VTBase.showLoading()
        HAPI.requestGetCateByPage(page: page, pageSize: pageSize, completion: {(dict) in
            VTBase.hideLoading()
            self.canLoadMore = false
            if let arr = dict.object(forKey: "data") as? [NSDictionary]{
                if arr.count > 0 {
                    self.productCates.addObjects(from: arr)
                    self.myColection.reloadData()
                    if arr.count > self.pageSize{
                        self.canLoadMore = true
                    }
                }
            }
        }){(error) in
            VTBase.hideLoading()
        }
    }
    func refreshData(){
        page = 0
        pageSize = 20
        canLoadMore = true
        productCates.removeAllObjects()
        myColection.reloadData()
        loadData()
        UIView.animate(withDuration: 0.1){
            self.myColection.pullToRefreshView.stopAnimating()
        }
    }
}
extension ProductsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productCates.count
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top: 5, left: 5, bottom: 0, right: 5)
//    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollCell", for: indexPath) as! ProductsCollCell
        
        if let data = productCates.object(at: indexPath.row) as? NSDictionary{
            if let name = data.object(forKey: "name") as? String{
                cell.lbName.text = name
            }
            if let url = data.object(forKey: "icon") as? String{
                cell.imgCell.setImageWithUrl(urlString: url)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //self.tabBarController?.tabBar.isHidden = true
        let productCatesIdVC = ProductWithCateIdVC.init()

        if let data = productCates.object(at: indexPath.row) as? NSDictionary{
            if let cateId = data.object(forKey: "_id") as? String{
                productCatesIdVC.cateId = cateId
            }
        }
        self.navigationController?.pushViewController(productCatesIdVC, animated: true)
        // an tabbar
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section > 0{
            let lastElement = productCates.count - 1
            if indexPath.row == lastElement{
                if self.canLoadMore{
                    page += 1
                    self.loadData()
                }
            }
        }
    }
    
}
