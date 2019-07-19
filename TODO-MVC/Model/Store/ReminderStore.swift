//
//  ReminderStore.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/19/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct ReminderStore: ReminderStoreContract{
    
    private let userDefaults = UserDefaults.standard
    private let codableTransformer = CodableTransformer()
    
    func getUserReminders(userAuthentication: UserAuthentication, onSuccess: @escaping ([Reminder]) -> (), onFailed: @escaping (ReminderError) -> ()) {
        guard let remindersEncoded = getAllRemindersEncoded() else{
            onFailed(ReminderError.ReproistoyrError)
            return
        }
        guard let remindersDecoded = decodeReminders(data: remindersEncoded) else{
            onFailed(ReminderError.ReproistoyrError)
            return
        }
        let remindersFilteredByUser = filterRemindersByUser(userAuthentication: userAuthentication, reminders: remindersDecoded)
        onSuccess(remindersFilteredByUser)
    }
    
    private func getAllRemindersEncoded()->Data?{
        let reminders = userDefaults.data(forKey: ReminderUserDefaultsKeys.reminders.rawValue)
        return reminders
    }
    
    private func decodeReminders(data: Data)->[Reminder]?{
        let remindersDecoded = codableTransformer.decodeObject(data: data, targetModel: [Reminder].self)
        return remindersDecoded
    }
    
    private func filterRemindersByUser(userAuthentication: UserAuthentication,reminders: [Reminder])->[Reminder]{
        let remindersFilteredByUser = reminders.filter{
            $0.userToken == userAuthentication.userIdentifier
        }
        return remindersFilteredByUser
    }
    
    
}
