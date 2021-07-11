//
//  String+Extension.swift
//  CovidStatistics
//
//  Created by Batuhan Baran on 3.07.2021.
//

import Foundation
import UIKit

extension String {
    func countryFlag() -> String {
      return String(String.UnicodeScalarView(
         self.unicodeScalars.compactMap(
           { UnicodeScalar(127397 + $0.value) })))
    }
    
    func convertToImage() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
