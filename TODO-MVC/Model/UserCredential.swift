//
//  UserCredential.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/14/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct UserCredential: Codable{
    
    private var _phoneNumber: String
    private var _password: String
    
    init(phoneNumber: String,password: String){
        self._phoneNumber = phoneNumber
        self._password = password
    }
    
    var phoneNumber: String{
        get{ return _phoneNumber }
        set{ _phoneNumber = newValue }
    }
    
    var password: String{
        get{ return _phoneNumber }
        set{ _password = newValue }
    }
    
}
