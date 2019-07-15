//
//  AuthenticationValidator.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/14/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

class AuthenticationValidator{
    
    public func validateObjectWithRegularExpression(object: String,regularExpression: String)->Bool{
        let regexPrediction = NSPredicate(format:"SELF MATCHES %@", regularExpression)
        let validationResult = regexPrediction.evaluate(with: object)
        return validationResult
    }
    
    func validatePhoneNumber(phoneNumber: String)->Bool{
        let phoneRegeularExpression = "^.{9,}$"
        let regexValidationResult = validateObjectWithRegularExpression(object: phoneNumber, regularExpression: phoneRegeularExpression)
        return regexValidationResult
    }
    
    func validatePassword(password: String)->Bool{
        let passwordRegeularExpression = "^.{8,}$"
        let regexValidationResult = validateObjectWithRegularExpression(object: password, regularExpression: passwordRegeularExpression)
        return regexValidationResult
    }
    
}
