//
//  UserAuthentication.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/14/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct UserAuthentication:Codable{
    
    private var _userAuthentication: String
    
    var userAuthentication: String{
        get{ return _userAuthentication }
        set{ _userAuthentication = newValue }
    }
    
}
