//
//  ReminderStoreContract.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/19/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

protocol ReminderStoreContract {
    func getUserReminders(userAuthentication: UserAuthentication,onSuccess:@escaping([Reminder])->(),onFailed:@escaping(ReminderError)->())
}
