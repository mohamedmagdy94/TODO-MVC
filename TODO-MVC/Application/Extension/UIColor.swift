//
//  UIColor.swift
//  MoviesApp
//
//  Created by Mohamed El-Taweel on 5/23/19.
//  Copyright © 2019 Mohamed El-Taweel. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
