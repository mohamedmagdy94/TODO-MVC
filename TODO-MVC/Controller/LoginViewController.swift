//
//  ViewController.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/13/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userPhoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var authenticaionStore: AuthenticationStoreContract!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authenticaionStore = AuthenticationStore()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onLoginButtonTapped(_ sender: Any) {
        login()
    }
    
    func validateLoginData()->Bool{
        let authenticationValidator = AuthenticationValidator()
        let phoneValidationResult = authenticationValidator.validatePhoneNumber(phoneNumber: userPhoneTextField.text ?? "")
        if !phoneValidationResult{
            self.showErrorIndicator(message: "Wrong Phone Number")
            return false
        }
        let passwordValidationResult = authenticationValidator.validatePassword(password: passwordTextField.text ?? "")
        if !passwordValidationResult{
            self.showErrorIndicator(message: "Wrong Password")
            return false
        }
        return true
    }
    
    func login(){
        let loginDataValidationResult = validateLoginData()
        if !loginDataValidationResult{
            return
        }
        let userCredential = UserCredential(phoneNumber: userPhoneTextField.text!, password: passwordTextField.text!)
        authenticaionStore.loginWithPhoneNameAndPassword(userCredential: userCredential, onSuccess: {[unowned self] (userAuthenticaion) in
            self.onUserAuthenticaionRetrieve(userAuthentication: userAuthenticaion)
        }) { (error) in
            
        }
    }
    
    private func onUserAuthenticaionRetrieve(userAuthentication: UserAuthentication?){
        if let userAuthentication = userAuthentication{
            authenticateUser(userAuthentication: userAuthentication)
        }else{
            handleWrongCredential()
        }
    }
    
    private func authenticateUser(userAuthentication: UserAuthentication){
        authenticaionStore.saveUserAuthenticaion(userAuthentication: userAuthentication, onSuccess: {[unowned self] in
            self.handleSuccessfullUserAuthentication()
        }) {[unowned self] (error) in
            self.handleSaveUserAuthenticationFail()
        }
    }
    
    private func handleWrongCredential(){
        showErrorIndicator(message: "Wrong Phone Number or Password")
    }
    
    private func handleFetchUserAuthenticaionError(error: AuthenticaionError){
        switch error {
        case .ConnectionError:
            showErrorIndicator(message: "Error in your connection")
        case .ReproistoyrError:
            showErrorIndicator(message: "Server Error,Please try again")
        }
    }
    
    private func handleSaveUserAuthenticationFail(){
        showErrorIndicator(message: "Server Error,Please try again")
    }
    
    private func handleSuccessfullUserAuthentication(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.setFirstScreen()
    }
    
}

