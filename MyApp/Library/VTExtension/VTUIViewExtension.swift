//
//  VTUIViewExtension.swift
//  Wimo
//
//  Created by Charles on 12/9/17.
//  Copyright © 2017 Charles. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
    enum VerticalLocation: String {
        case bottom
        case top
    }
    extension UIView{
        func vtSetCornerRadius(vtRadius : CGFloat){
            self.layoutIfNeeded()
            self.layer.masksToBounds = true
            self.layer.cornerRadius = vtRadius
        }
        open func addNotificationObserver(_ name: String, selector: Selector) {
            NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name(rawValue: name), object: nil)
        }
        
        func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.1, radius: CGFloat = 1.0) {
            switch location {
            case .bottom:
                addShadow(offset: CGSize(width: -1, height: 1), color: color, opacity: opacity, radius: radius)
            case .top:
                addShadow(offset: CGSize(width: 0, height: -1), color: color, opacity: opacity, radius: radius)
            }
        }
        
        func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.1, radius: CGFloat = 1.0) {
            self.layer.masksToBounds = false
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOffset = offset
            self.layer.shadowOpacity = opacity
            self.layer.shadowRadius = radius
            
            self.layer.shouldRasterize = true
            let scale = true
            self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
        // OUTPUT 1
        func dropShadow(scale: Bool = true) {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.5
            layer.shadowOffset = CGSize(width: -1, height: 1)
            layer.shadowRadius = 1
            
            layer.shadowPath = UIBezierPath(rect: bounds).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
        
        // OUTPUT 2
        func dropShadow(){
            //CGSize(width: -1, height: 1), radius: 3, scale: true
            dropShadow(color: .black, opacity: 0.3, offSet: CGSize(width: -1, height: 0.5), radius: 3, scale: true)
        }
        func dropShadow(size : CGSize){
            dropShadow(color: .black, opacity: 0.3, offSet: size, radius: 3, scale: true)
        }
        
        func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
            self.layer.masksToBounds = false
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOpacity = opacity
            self.layer.shadowOffset = offSet
            self.layer.shadowRadius = radius
            
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            self.layer.shouldRasterize = true
            layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
    }
#endif
