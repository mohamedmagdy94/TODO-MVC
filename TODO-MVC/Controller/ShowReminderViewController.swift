//
//  ShowReminderViewController.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/15/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class ShowReminderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onMenuButtonTapped(_ sender: Any) {
        openMenu()
    }
    
    func openMenu(){
        self.openLeft()
    }
    
}
