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
    private var _name: String
    
    init(phoneNumber: String,password: String,name: String) {
        self._phoneNumber = phoneNumber
        self._password = password
        self._name = name
    }
    
    var phoneNumber: String{
        get{ return _phoneNumber }
        set{ _phoneNumber = newValue }
    }
    
    var password: String{
        get{ return _phoneNumber }
        set{ _password = newValue }
    }
    
    var name: String{
        get{ return _name }
        set{ _name = newValue }
    }
    
    var userToken: String{
        get{ return phoneNumber }
    }
    
}
