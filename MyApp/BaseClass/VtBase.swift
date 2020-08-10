//
//  VtBase.swift
//  Wimo
//
//  Created by Charles on 1/4/18.
//  Copyright © 2018 Charles. All rights reserved.
//

import Foundation
import Toaster
import SVProgressHUD

import UIKit
import MobileCoreServices
import AVFoundation
import Photos
//import Firebase

public struct VTBase {
    //MARK: SvProgessHub
    public static func baseColor() -> UIColor{
//        return UIColor.init(hexString: "3C7ADA")!
        return UIColor.blue
//        return UIColor.init(r: 0, g: 185, b: 249) tozaco
    }
    public static func baseBackgroundColor() -> UIColor{
        return UIColor.init(named: "#EDEFF1") ?? UIColor.white
    }
    public static func showLoadingWithMessage(_ imessage : String){
        SVProgressHUD.show(withStatus: imessage)
    }
    public static func showLoading(){
        SVProgressHUD.show(withStatus: "Loading")
    }
    public static func hideLoading(){
        SVProgressHUD.dismiss()
    }
    public static func showLoading(progress : Float, message : String){
        SVProgressHUD.showProgress(progress, status: message)
    }
    // MARK: show Toast and loading
    public static func showToastWithMessage(message:String){
        Timer.runThisAfterDelay(seconds: 0.0) {
            Toast(text: message).show()
        }
    }
    //MARK:CHECK authorisationStatus STATUS
    public static func checkPhotoLibraryAuthorisation(handler: @escaping (_ authorized : Bool) -> Swift.Void){
        if PHPhotoLibrary.authorizationStatus() == .authorized{
            handler(true)
        }else{
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == PHAuthorizationStatus.authorized{
                    handler(true)
                }else{
                    let alert = UIAlertController(title: "Photo", message: "Vui lòng cho phép ứng dụng truy cập thư viện ảnh để sử dụng chức năng này", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                        } else {
                            UIApplication.shared.openURL(URL(string: UIApplication.openSettingsURLString)!)
                        }
                    }))
                    AppManager.shared.currentViewController!.present(alert, animated: true)
                    handler(false)
                }
            })
            
        }
    }
    public static func checkCameraAuthorisation(handler: @escaping (_ authorized : Bool) -> Swift.Void){
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
            handler(true)
        }else{
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted: Bool) -> Void in
                if granted == true {
                    handler(true)
                } else {
                    let alert = UIAlertController(title: "Photo", message: "Vui lòng cho phép ứng dụng sử dụng camera để sử dụng chức năng này", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                        } else {
                            UIApplication.shared.openURL(URL(string: UIApplication.openSettingsURLString)!)
                        }
                    }))
                    AppManager.shared.currentViewController!.present(alert, animated: true)
                    handler(false)
                }
            })
        }
    }
    public static func checkLocationAuthorisation(locationMgr : CLLocationManager){
        let status  = CLLocationManager.authorizationStatus()
        if status == .notDetermined {
            locationMgr.requestWhenInUseAuthorization()
        }
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            AppManager.shared.currentViewController!.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: FLOAT TO CURRENTCY
     public static func doubleToCurencyString(value : Double) -> String{
        let formatter = NumberFormatter()
        formatter.locale = AppManager.shared.Locale_vi
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        let price = String(format: "%.1f", value)
        if let myDouble = Double(price), let num = myDouble as? NSNumber{
            let curency = formatter.string(from: num) ?? ""
            return curency + "đ"
        }else{
            return ""
        }
    }
    
    //FIREBASE HELPER
    public static func firebaseLogAction(type: String, name : String, fullDes: String){
//        Analytics.logEvent(type, parameters: [
//            "name": name as NSObject,
//            "full_text": fullDes as NSObject
//            ])
    }
}
