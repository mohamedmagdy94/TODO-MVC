//
//  RegisterValidator.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/15/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

class RegisterValidator: AuthenticationValidator{
    
    func validateName(name: String)->Bool{
        let nameRegaularExpression = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
        let nameValidationresult =  validateObjectWithRegularExpression(object: name, regularExpression: nameRegaularExpression)
        return nameValidationresult
    }
    
}
