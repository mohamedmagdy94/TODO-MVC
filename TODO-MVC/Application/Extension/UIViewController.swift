//
//  UIViewController.swift
//  Tourism
//
//  Created by Mohamed El-Taweel on 6/29/19.
//  Copyright © 2019 Going. All rights reserved.
//

import Foundation
import UIKit
import ProgressHUD

extension Loadable where Self: UIViewController{
    
    func showLoadingIndicator(){
        DispatchQueue.main.async {
            ProgressHUD.show()
        }
    }
    
    func hideLoadingIndicator(){
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
        }
    }
    
    func showSucessIndicator(message: String? = nil){
        DispatchQueue.main.async {
            if let message = message{
                ProgressHUD.showSuccess(message)
            }else{
                ProgressHUD.showSuccess()
            }
        }
    }
    
    func showErrorIndicator(message: String? = nil){
        DispatchQueue.main.async {
            if let message = message{
                ProgressHUD.showError(message)
            }else{
                ProgressHUD.showError()
            }
        }
        
    }
    
}

extension UIViewController: Loadable{}
