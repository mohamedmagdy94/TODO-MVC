//
//  UserAuthentication.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/14/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct UserAuthentication:Codable{
    
    private var _userIdentifier: String
    
    init(userIdentifier: String) {
        _userIdentifier = userIdentifier
    }
    
    var userIdentifier: String{
        get{ return _userIdentifier }
        set{ _userIdentifier = newValue }
    }
    
}
