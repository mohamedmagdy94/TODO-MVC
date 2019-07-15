//
//  UIDate.swift
//  Tourism
//
//  Created by Mohamed El-Taweel on 7/4/19.
//  Copyright © 2019 Going. All rights reserved.
//

import Foundation

extension Date{
    func addDays(days: Int)->Date?{
        let newDate = Calendar.current.date(byAdding: .day, value: days, to: self)
        return newDate
    }
    
    func subDays(days: Int)->Date?{
        let negativeDays = days * -1
        let newDate = Calendar.current.date(byAdding: .day, value: negativeDays, to: self)
        return newDate
    }
    
    func toString(format: String = "yyyy-MM-dd")->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateInString = dateFormatter.string(from: Date())
        return dateInString
    }
}
