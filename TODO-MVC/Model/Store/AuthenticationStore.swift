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
        let users = fetchUsers()
        guard users.count > 0 else{
            onSuccess(nil)
            return
        }
        let user = users.first{
            ($0.phoneNumber == userCredential.phoneNumber && $0.password == userCredential.password)
        }
        if let user = user{
            let userAuthentication = UserAuthentication.init(userIdentifier: user.userToken)
            onSuccess(userAuthentication)
        }else{
            onSuccess(nil)
        }
    }
    
    private func fetchEncodedUsersFromStorage()->Data?{
        let encodedUsers = userDefaults.data(forKey: AuthenticationUserDefaultKeys.Users.rawValue)
        return encodedUsers
    }
    
    private func transformEncodedUsersToUsers(encodedUsers: Data?)->[User]{
        let users = [User]()
        guard let encodedUsers = encodedUsers else{
            return users
        }
        guard let decodedUsers = codableTransformer.decodeObject(data: encodedUsers, targetModel: [User].self) else{
            return users
        }
        return decodedUsers
    }
    
    private func fetchUsers()->[User]{
        let encodedUsers = fetchEncodedUsersFromStorage()
        let users = transformEncodedUsersToUsers(encodedUsers: encodedUsers)
        return users
    }
    
    func saveUserAuthenticaion(userAuthentication: UserAuthentication,onSuccess:@escaping()->(),onFailed:@escaping(AuthenticaionError)->()){
        guard let encodedUserAuthentication = codableTransformer.encodeObject(object: userAuthentication) else{
            onFailed(AuthenticaionError.ReproistoyrError)
            return
        }
        userDefaults.set(encodedUserAuthentication, forKey: AuthenticationUserDefaultKeys.UserAuthentication.rawValue)
        onSuccess()
        
    }
    
    func registerUser(user: User,onSuccess:@escaping(UserAuthentication)->(),onFailed:@escaping(AuthenticaionError)->()){
        var users = fetchUsers()
        users.append(user)
        let usersEncoded = codableTransformer.encodeObject(object: users)
        userDefaults.set(usersEncoded, forKey: AuthenticationUserDefaultKeys.Users.rawValue)
        let userAuthentication = UserAuthentication(userIdentifier: user.userToken)
        onSuccess(userAuthentication)
    }
    
    func logout(onSuccess:@escaping()->(),onFailed:@escaping(AuthenticaionError)->()){
        userDefaults.removeObject(forKey: AuthenticationUserDefaultKeys.UserAuthentication.rawValue)
        onSuccess()
    }

    func isUserAuthenticated()->Bool{
        if let _ = userDefaults.data(forKey: AuthenticationUserDefaultKeys.UserAuthentication.rawValue){
            return true
        }else{
            return false
        }
        
    }
    
}
