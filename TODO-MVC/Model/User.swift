//
//  User.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/15/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct User: Codable {
    private var _phoneNumber: String
    private var _password: String
    
    var phoneNumber: String{
        get{ return _phoneNumber }
        set{ _phoneNumber = newValue }
    }
    
    var password: String{
        get{ return _phoneNumber }
        set{ _password = newValue }
    }
    
}
