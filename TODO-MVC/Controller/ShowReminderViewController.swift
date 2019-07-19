//
//  ShowReminderViewController.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/15/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class ShowReminderViewController: UIViewController {
    
    @IBOutlet weak var remindersTableView: UITableView!
    
    var remindersHelper = Reminders(reminders: [Reminder]())
    var reminders = [Reminder]()
    var authenticationStore: AuthenticationStore!
    var remindersStore: ReminderStoreContract!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    private func setup(){
        remindersStore = ReminderMockStore()
        authenticationStore = AuthenticationStore()
        getReminders()
        setupUI()
    }
    
    private func setupUI(){
        remindersTableView.delegate = self
        remindersTableView.dataSource = self
        remindersTableView.tableHeaderView = UIView()
        remindersTableView.tableFooterView = UIView()
    }
    
    private func getReminders(){
        authenticationStore.getUserAuthenticaion(onSuccess: {[unowned self] (userAuthentication) in
            self.handleFetchUserAuthenticationSuccess(userAuthentication: userAuthentication)
        }) {[unowned self] (error) in
            self.handleUserAuthenticationFetchFailed(error: error)
        }
    }
    
    private func handleFetchUserAuthenticationSuccess(userAuthentication: UserAuthentication){
        self.remindersStore.getUserReminders(userAuthentication: userAuthentication, onSuccess: {[unowned self] (reminders) in
                self.handleFetchRemindersSuccessfully(reminders: reminders)
            }, onFailed: { (error) in
                self.showErrorIndicator(message: "Server Error,Please Try Again Later")
        })
    }
    
    private func handleFetchRemindersSuccessfully(reminders: [Reminder]){
        self.remindersHelper = Reminders(reminders: reminders)
        self.reminders = self.remindersHelper.getRemindersArrangedByPriorityDescinding()
        self.remindersTableView.reloadData()
    }
    
    private func handleUserAuthenticationFetchFailed(error: AuthenticaionError){
        let loginViewController = UINavigationController.getViewController(storyboardName: StoryboardName.Authentication.rawValue, viewControllerID: ViewControllerID.AuthenticaionNavigationController.rawValue)
        self.present(loginViewController, animated: true)
    }
    
    @IBAction func onMenuButtonTapped(_ sender: Any) {
        openMenu()
    }
    
    func openMenu(){
        self.openLeft()
    }
    
    @IBAction func onAddReminderButtonTapped(_ sender: Any) {
        
    }
    
}

extension ShowReminderViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfReminders = reminders.count
        return numberOfReminders
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminder", for: indexPath) as! ReminderTableViewCell
        cell.setup(with: reminders[indexPath.row])
        cell.layoutIfNeeded()
        return cell
    }
    
    
}
