//
//  Main.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/15/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation
import UIKit
import SlideMenuControllerSwift

struct Main{
    
    private var authenticaionStore: AuthenticationStoreContract
    
    init(authenticaionStore: AuthenticationStoreContract) {
        self.authenticaionStore = authenticaionStore
    }
    
    func getInitialViewController()->UIViewController{
        let initialViewControllerWithoutMenu = getInitialViewControllerWithoutMenu()
        let initialViewControllerWithMenu = addMenuToInitialViewController(initialViewController: initialViewControllerWithoutMenu)
        return initialViewControllerWithMenu
        
    }
    
    private func getInitialViewControllerWithoutMenu()->UIViewController{
        let userAuthenticationStatus = authenticaionStore.isUserAuthenticated()
        if userAuthenticationStatus{
            let initialViewControllerWithoutMenu = UINavigationController.getViewController(storyboardName: StoryboardName.Reminder.rawValue, viewControllerID: ViewControllerID.RemindersNavigationController.rawValue)
            return initialViewControllerWithoutMenu
        }else{
            let initialViewControllerWithoutMenu = UINavigationController.getViewController(storyboardName: StoryboardName.Authentication.rawValue, viewControllerID: ViewControllerID.AuthenticaionNavigationController.rawValue)
            return initialViewControllerWithoutMenu
        }
    }
    
    private func addMenuToInitialViewController(initialViewController: UIViewController)->UIViewController{
        let menuViewController = UINavigationController.getViewController(storyboardName: StoryboardName.Menu.rawValue, viewControllerID: ViewControllerID.MenuViewController.rawValue)
        let initialViewControllerWithMenu = SlideMenuController(mainViewController: initialViewController, leftMenuViewController: menuViewController)
        return initialViewControllerWithMenu

    }
    
}
