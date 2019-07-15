//
//  AuthenticationReprository.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/14/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct AuthenticationStore: AuthenticationStoreContract{
    
    private let userDefaults = UserDefaults.standard
    private let codableTransformer = CodableTransformer()
    
    func loginWithPhoneNameAndPassword(userCredential: UserCredential, onSuccess: @escaping (UserAuthentication?) -> (), onFailed: @escaping (AuthenticaionError) -> ()) {
        guard let encodedUsers = userDefaults.data(forKey: AuthenticationUserDefaultKeys.Users.rawValue) else{
            onSuccess(nil)
            return
        }
        let decodedUsers = codableTransformer.decodeObject(data: encodedUsers, targetModel: [User].self)
        let user = decodedUsers?.first{
            ($0.phoneNumber == userCredential.phoneNumber && $0.password == userCredential.password)
        }
        if let user = user{
            let userAuthentication = UserAuthentication.init(userIdentifier: user.phoneNumber)
            onSuccess(userAuthentication)
        }else{
            onSuccess(nil)
        }
    }
    
    
    func saveUserAuthenticaion(userAuthentication: UserAuthentication,onSuccess:@escaping()->(),onFailed:@escaping(AuthenticaionError)->()){
        guard let encodedUserAuthentication = codableTransformer.encodeObject(object: userAuthentication) else{
            onFailed(AuthenticaionError.ReproistoyrError)
            return
        }
        userDefaults.set(encodedUserAuthentication, forKey: AuthenticationUserDefaultKeys.UserAuthentication.rawValue)
        onSuccess()
        
    }
    
    
    
}
