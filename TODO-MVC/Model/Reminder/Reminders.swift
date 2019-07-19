//
//  Reminders.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/19/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct Reminders {
    
    private var reminders: [Reminder]
    
    init(reminders: [Reminder]) {
        self.reminders = reminders
    }
    
    func getRemindersArrangedByPriorityDescinding()->[Reminder]{
        let remindersArrangedByPriorityDescinding = reminders.sorted { (currentReminder, nextReminder) -> Bool in
            currentReminder.priority.rawValue < nextReminder.priority.rawValue
        }
        return remindersArrangedByPriorityDescinding
    }
    
    func getReminders()->[Reminder]{
        return reminders
    }
    
}
