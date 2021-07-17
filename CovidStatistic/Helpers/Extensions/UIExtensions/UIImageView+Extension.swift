//
//  UIImageView+Extension.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func imageFromKingfisher(imageUrl: String) {
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
