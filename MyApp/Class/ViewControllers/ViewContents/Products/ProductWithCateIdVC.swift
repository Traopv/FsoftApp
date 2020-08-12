//
//  ProductWithCateIdVC.swift
//  MyApp
//
//  Created by admin on 8/10/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProductWithCateIdVC: UIViewController {

    @IBOutlet weak var collectionProduct: UICollectionView!
    
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    var productCateId : NSMutableArray = NSMutableArray()
    var page : Int = 0
    var pageSize : Int = 20
    var cateId : String = ""
    var canLoadMore : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionProduct.addPullToRefresh(){
            self.refreshData()
        }
        // Do any additional setup after loading the view.
        loadData()
        collectionProduct.register(UINib.init(nibName: "productCateId", bundle: nil), forCellWithReuseIdentifier: "productCateId")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpCollectionViewItems()
    }
    func setUpCollectionViewItems(){
        if collectionViewFlowLayout == nil{
            let numberOfItemInRow : CGFloat = 2
            let iLineSpaing : CGFloat = 5
            let interItemSpacing : CGFloat = 5
            //let numberOfItemInColum : CGFloat = 10 / numberOfItemInRow
            let iWidth = (collectionProduct.frame.size.width - (numberOfItemInRow - 1) * interItemSpacing) / numberOfItemInRow
            let iHeight : CGFloat = 312//(view.bounds.height - (10 / numberOfItemInRow - 1) * iLineSpaing) / numberOfItemInColum

            collectionViewFlowLayout = UICollectionViewFlowLayout()

            collectionViewFlowLayout.itemSize = CGSize(width: iWidth, height: iHeight)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = iLineSpaing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing

            collectionProduct.setCollectionViewLayout(collectionViewFlowLayout, animated : true)
        }
    }
    func loadData(){
        VTBase.showLoading()
        HAPI.requestGetProductsByParam(cateId: cateId, page: page, pageSize: pageSize, completion: {(dict) in
            VTBase.hideLoading()
            self.canLoadMore = false
            if let arr = dict.object(forKey: "data") as? [NSDictionary]{
                if arr.count > 0 {
                    self.productCateId.addObjects(from: arr)
                    self.collectionProduct.reloadData()
                    if arr.count > self.pageSize {
                        self.canLoadMore = true
                    }
                }
            }
        }){(error)in
            VTBase.hideLoading()
        }
    }
    func refreshData(){
        page = 0
        pageSize = 20
        productCateId.removeAllObjects()
        collectionProduct.reloadData()
        loadData()
        UIView.animate(withDuration: 0.1){
            self.collectionProduct.pullToRefreshView.stopAnimating()
        }
    }
}
extension ProductWithCateIdVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productCateId.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCateId", for: indexPath) as! productCateId
        if let data = productCateId.object(at: indexPath.row) as? NSDictionary{
            if let url = data.object(forKey: "img") as? String{
                cell.imageCell.setImageWithUrl(urlString: url)
            }
            if let name = data.object(forKey: "metaTitle") as? String{
                cell.lbName.text = name
            }
            if let time = data.object(forKey: "totalTime") as? String{
                cell.lbTime.text = time
            }
            if let level = data.object(forKey: "level") as? String{
                cell.lbLevel.text = level
            }
            if let userInfo = data.object(forKey: "userinfo") as? NSDictionary{
                if let avataUrl = userInfo.object(forKey: "avatarUrl") as? String{
                    cell.imgDisplay.setImageWithUrl(urlString: avataUrl)
                }
                if let displayName = userInfo.object(forKey: "displayName") as? String{
                    cell.lbTitleDis.text = displayName
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailProduct = DetailProductVC.init()
        self.navigationController?.pushViewController(detailProduct, animated: true)
        // an tabbar
         self.tabBarController?.tabBar.isHidden = true
    }
    
}
