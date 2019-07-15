//
//  UIImageView.swift
//  Tourism
//
//  Created by Mohamed El-Taweel on 7/13/19.
//  Copyright © 2019 Going. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func setCircleLayout(){
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
}
