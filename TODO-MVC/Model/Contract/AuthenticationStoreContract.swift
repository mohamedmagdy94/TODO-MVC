//
//  AuthenticationReprositoryContract.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/14/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

protocol AuthenticationStoreContract {
    func loginWithPhoneNameAndPassword(userCredential: UserCredential,onSuccess:@escaping(UserAuthentication?)->(),onFailed:@escaping(AuthenticaionError)->())
    func saveUserAuthenticaion(userAuthentication: UserAuthentication,onSuccess:@escaping()->(),onFailed:@escaping(AuthenticaionError)->())
    func registerUser(user: User,onSuccess:@escaping(UserAuthentication)->(),onFailed:@escaping(AuthenticaionError)->())
    func logout(onSuccess:@escaping()->(),onFailed:@escaping(AuthenticaionError)->())
    func isUserAuthenticated()->Bool
    func getUserAuthenticaion(onSuccess:@escaping(UserAuthentication)->(),onFailed:@escaping(AuthenticaionError)->())
}
