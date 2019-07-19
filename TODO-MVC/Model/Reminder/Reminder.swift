//
//  Reminder.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/19/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct Reminder: Codable{
    
    private var _id: String
    private var _title: String
    private var _description: String
    private var _priority: ReminderPriority
    private var _date: Date
    private var _notes: [String:String]
    private var _userToken: String
    
    init() {
        self._id = ""
        self._title = ""
        self._description = ""
        self._priority = .Low
        self._date = Date()
        self._notes = [String:String]()
        self._userToken = ""
    }
    
    var id: String{
        get{ return _id }
        set{ _id = newValue }
    }
    
    var title: String{
        get{ return _title }
        set{ _title = newValue }
    }
    
    var description: String{
        get{ return _description }
        set{ _description = newValue }
    }
    
    var priority: ReminderPriority{
        get{ return _priority }
        set{ _priority = newValue }
    }
    
    var date: Date{
        get{ return _date }
        set{ _date = newValue }
    }
    
    var notes: [String:String]{
        get{ return _notes }
        set{ _notes = newValue }
    }
    
    var userToken: String{
        get{ return _userToken }
        set{ _userToken = newValue }
    }
    
}
