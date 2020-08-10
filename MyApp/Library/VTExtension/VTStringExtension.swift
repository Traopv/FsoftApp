//
//  VtNSStringExtension.swift
//  DMS
//
//  Created by Charles on 7/28/17.
//  Copyright © 2017 Charles. All rights reserved.
//

import UIKit

extension String{
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
            NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
        ]
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: options,
            documentAttributes: nil) else { return nil }
        return html
    }
    public func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
    func convertSignedToUnSignedString() -> String{
        //Dau ngang
        var i_codau : String = self
        i_codau = i_codau.replacingOccurrences(of:"Ă", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"Â", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"Ê", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"Ô", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"Ơ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"Ư", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ă", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"â", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"ê", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"ô", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"ơ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"ư", with: "u")
        //Dau huyền
        i_codau = i_codau.replacingOccurrences(of:"À", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"à", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ằ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ằ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ầ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ầ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"È", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"è", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Ề", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"ề", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Ì", with: "I")
        i_codau = i_codau.replacingOccurrences(of:"ì", with: "i")
        i_codau = i_codau.replacingOccurrences(of:"Ò", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ò", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ồ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ồ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ờ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"ờ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ù", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ù", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ừ", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ừ", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ỳ", with: "Y")
        i_codau = i_codau.replacingOccurrences(of:"ỳ", with: "y")
        //Dau sắc
        i_codau = i_codau.replacingOccurrences(of:"Á", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"á", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ắ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ắ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ấ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ấ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"É", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"é", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Ế", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"ế", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Í", with: "I")
        i_codau = i_codau.replacingOccurrences(of:"í", with: "i")
        i_codau = i_codau.replacingOccurrences(of:"Ó", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ó", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ố", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ố", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ớ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ớ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ú", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ú", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ứ", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ứ", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ý", with: "Y")
        i_codau = i_codau.replacingOccurrences(of:"ý", with: "y")
        //Dau hỏi
        i_codau = i_codau.replacingOccurrences(of:"Ả", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ả", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ẳ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ẳ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ẩ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ẩ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ẻ", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"ẻ", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Ể", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"ể", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Ỉ", with: "I")
        i_codau = i_codau.replacingOccurrences(of:"ỉ", with: "i")
        i_codau = i_codau.replacingOccurrences(of:"Ỏ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ỏ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ổ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ổ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ở", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ở", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ủ", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ủ", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ử", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ử", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ỷ", with: "Y")
        i_codau = i_codau.replacingOccurrences(of:"ỷ", with: "y")
        //Dau nga
        i_codau = i_codau.replacingOccurrences(of:"Ã", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ã", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ẵ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ẵ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ẫ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ẫ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ẽ", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"ẽ", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Ễ", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"ễ", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Ĩ", with: "I")
        i_codau = i_codau.replacingOccurrences(of:"ĩ", with: "i")
        i_codau = i_codau.replacingOccurrences(of:"Õ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"õ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ỗ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ỗ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ỡ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ỡ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ũ", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ũ", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ữ", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ữ", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ỹ", with: "Y")
        i_codau = i_codau.replacingOccurrences(of:"ỹ", with: "y")
        //Dau nang
        i_codau = i_codau.replacingOccurrences(of:"Ạ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ạ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ặ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ặ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ậ", with: "A")
        i_codau = i_codau.replacingOccurrences(of:"ậ", with: "a")
        i_codau = i_codau.replacingOccurrences(of:"Ẹ", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"ẹ", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Ệ", with: "E")
        i_codau = i_codau.replacingOccurrences(of:"ệ", with: "e")
        i_codau = i_codau.replacingOccurrences(of:"Ị", with: "I")
        i_codau = i_codau.replacingOccurrences(of:"ị", with: "i")
        i_codau = i_codau.replacingOccurrences(of:"Ọ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ọ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ộ", with: "O")
        i_codau = i_codau.replacingOccurrences(of:"ộ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ợ", with: "o")
        i_codau = i_codau.replacingOccurrences(of:"Ụ", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ụ", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ự", with: "U")
        i_codau = i_codau.replacingOccurrences(of:"ự", with: "u")
        i_codau = i_codau.replacingOccurrences(of:"Ỵ", with: "Y")
        i_codau = i_codau.replacingOccurrences(of:"ỵ", with: "y")
        
        i_codau = i_codau.replacingOccurrences(of:"Đ", with: "D")
        i_codau = i_codau.replacingOccurrences(of:"đ", with: "d")
        
        return i_codau;
    }
}


