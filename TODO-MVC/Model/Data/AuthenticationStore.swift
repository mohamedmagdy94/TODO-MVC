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
        guard let encodedUserAuthentication = userDefaults.data(forKey: userCredential.phoneNumber) else{
            onSuccess(nil)
            return
        }
        guard let decodedUserAuthentication = codableTransformer.decodeObject(data: encodedUserAuthentication, targetModel: UserAuthentication.self) else{
            onSuccess(nil)
            return
        }
        onSuccess(decodedUserAuthentication)
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
