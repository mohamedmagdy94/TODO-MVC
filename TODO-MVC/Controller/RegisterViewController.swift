//
//  RegisterViewController.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/15/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    var authenticationStore: AuthenticationStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authenticationStore = AuthenticationStore()
    }
    
    @IBAction func onRegisterButtonPressed(_ sender: UIButton) {
        register()
    }
    
    private func register(){
        let registerationDataValidationResult = validateRegisterData()
        guard registerationDataValidationResult else{
            return
        }
        registerUser()
    }
    
    private func validateRegisterData()->Bool{
        let registerationValidator = RegisterValidator()
        let nameValidationResult = registerationValidator.validateName(name: nameTextField.text ?? "")
        guard nameValidationResult else{
            self.showErrorIndicator(message: "Wrong Name")
            return false
        }
        let phoneValidationResult = registerationValidator.validatePhoneNumber(phoneNumber: phoneTextField.text ?? "")
        guard phoneValidationResult else{
            self.showErrorIndicator(message: "Wrong Phone")
            return false
        }
        let passwordValidationResult = registerationValidator.validatePassword(password: passwordTextField.text ?? "")
        guard passwordValidationResult else{
            self.showErrorIndicator(message: "Wrong Password")
            return false
        }
        return true
    }
    
    private func registerUser(){
        let user = User.init(phoneNumber: phoneTextField.text!,
                             password: passwordTextField.text!,
                             name: nameTextField.text!)
        authenticationStore.registerUser(user: user, onSuccess: {[unowned self] (userAuthentication) in
            self.authenticateUser(userAuthentication: userAuthentication)
        }) {[unowned self] (error) in
            self.onRegisterUserFailed(error: error)
        }
    }
    
    private func onRegisterUserFailed(error: AuthenticaionError){
        switch error {
        case .ConnectionError:
            showErrorIndicator(message: "Error in your connection")
        case .ReproistoyrError:
            showErrorIndicator(message: "Server Error,Please try again")
        }
    }
    
    private func authenticateUser(userAuthentication: UserAuthentication){
        self.authenticationStore.saveUserAuthenticaion(userAuthentication: userAuthentication, onSuccess: {[unowned self] in
            self.onUserAuthenticationSuccess()
        }) {[unowned self] (error) in
            self.onUserAuthenticationFailed(error: error)
        }
    }
    
    private func onUserAuthenticationSuccess(){
        let showRemindersViewController = UINavigationController.getViewController(storyboardName: StoryboardName.Reminder.rawValue, viewControllerID: ViewControllerID.ShowReminderViewController.rawValue)
        self.navigationController?.pushViewController(showRemindersViewController, animated: true)
    }
    
    private func onUserAuthenticationFailed(error: AuthenticaionError){
        switch error {
        case .ConnectionError:
            showErrorIndicator(message: "Error in your connection")
        case .ReproistoyrError:
            showErrorIndicator(message: "Server Error,Please try again")
        }
    }
    

}
