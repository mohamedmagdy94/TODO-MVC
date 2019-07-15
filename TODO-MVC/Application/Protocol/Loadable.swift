//
//  Loadable.swift
//  Tourism
//
//  Created by Mohamed El-Taweel on 6/29/19.
//  Copyright © 2019 Going. All rights reserved.
//

import Foundation

protocol Loadable {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showSucessIndicator(message: String?)
    func showErrorIndicator(message: String?)
}
