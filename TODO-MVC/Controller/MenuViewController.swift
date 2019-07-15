//
//  MenuViewController.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/15/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    var authenticationStore: AuthenticationStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authenticationStore = AuthenticationStore()
    }

    @IBAction func onMenuItemTapped(_ sender: UIButton) {
         let navigationController = self.slideMenuController()?.mainViewController as! UINavigationController
         let topViewController = navigationController.topViewController
         authenticationStore.logout(onSuccess: {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.setFirstScreen()
         }) {[unowned self] (AuthenticaionError) in
         self.showErrorIndicator(message: "Server Error,Please try again later")
         
         }
    }
    
    
    
    
}
