//
//  VTUIImageExtension.swift
//  DMS
//
//  Created by Charles on 7/28/17.
//  Copyright © 2017 Charles. All rights reserved.
//
#if os(iOS) || os(tvOS)
import SDWebImage
import UIKit

extension UIImageView{
    func setImageWithUrl(urlString : String){
        self.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "default-img.png"))
    }
    func clearSDWebImageCache(){
        SDImageCache.shared.clearMemory()
        SDImageCache.shared.clearDisk()
    }
//    public func vtSetCornerRadius(vtRadius : CGFloat){
//        self.layoutIfNeeded()
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = vtRadius
//    }
}
#endif
