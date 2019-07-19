//
//  ReminderBuilder.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/19/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

class ReminderBuilder {
    private var reminder: Reminder
    
    init() {
        reminder = Reminder()
    }
    
    func withID(id: String)->ReminderBuilder{
        reminder.id = id
        return self
    }
    
    func withTitle(title: String)->ReminderBuilder{
        reminder.title = title
        return self
    }
    
    func withDescription(description: String)->ReminderBuilder{
        reminder.description = description
        return self
    }
    
    func withPriority(priority: ReminderPriority)->ReminderBuilder{
        reminder.priority = priority
        return self
    }
    
    func withDate(date: Date)->ReminderBuilder{
        reminder.date = date
        return self
    }
    
    func withNotes(notes: [String:String])->ReminderBuilder{
        reminder.notes = notes
        return self
    }
    
    func withUserToken(userToken: String)->ReminderBuilder{
        reminder.userToken = userToken
        return self
    }
    
    func build()->Reminder{
        return reminder
    }
    
}
