//
//  Calendar++.swift
//  Client
//
//  Created by Ampe on 9/25/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

extension Calendar {
    static let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy MM dd"
        dateFormatter.isLenient = true
        
        return dateFormatter
    }()
}

extension Calendar {
    func dateFormatterComponents(from date: Date) -> (year: Int, month: Int, day: Int)? {
        
        Calendar.formatter.timeZone = timeZone
        Calendar.formatter.locale = locale
        Calendar.formatter.calendar = self
        
        let comp = dateComponents([.year, .month, .day], from: date)
        
        guard
            let year = comp.year,
            let month = comp.month,
            let day = comp.day
        else {
            return nil
        }
        
        return (year, month, day)
    }
    
    func startOfMonth(for date: Date) -> Date? {
        guard let comp = dateFormatterComponents(from: date) else {
            return nil
        }
        
        return Calendar.formatter.date(from: "\(comp.year) \(comp.month) 01")
    }
    
    func endOfMonth(for date: Date) -> Date? {
        guard
            let comp = dateFormatterComponents(from: date),
            let day = self.range(of: .day, in: .month, for: date)?.count,
            let retVal = Calendar.formatter.date(from: "\(comp.year) \(comp.month) \(day)")
        else {
            return nil
        }
        
        return retVal
    }
}
