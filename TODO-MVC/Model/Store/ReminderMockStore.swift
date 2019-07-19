//
//  ReminderMockStore.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/19/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct ReminderMockStore: ReminderStoreContract{
    
    func getUserReminders(userAuthentication: UserAuthentication, onSuccess: @escaping ([Reminder]) -> (), onFailed: @escaping (ReminderError) -> ()) {
        var mockReminders = [Reminder]()
        for i in 0...5{
            let reminderPriority = ReminderPriority.init(rawValue: i % 3) ?? ReminderPriority.High
            var reminderNotes = [String:String]()
            for x in 0...i{
                reminderNotes["Test Key \(x)"] = "Test Value \(x)"
            }
            let reminderBuilder = ReminderBuilder()
            let reminder = reminderBuilder
            .withDate(date: Date())
            .withDescription(description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ")
            .withID(id: "\(i)")
            .withNotes(notes: reminderNotes)
            .withPriority(priority: reminderPriority)
            .withTitle(title: "Test \(i)")
            .withUserToken(userToken: "")
            .build()
            mockReminders.append(reminder)
        }
        onSuccess(mockReminders)
    }
    
    
}
