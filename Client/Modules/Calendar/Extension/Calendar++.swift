//
//  Calendar++.swift
//  Client
//
//  Created by Ampe on 9/25/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

extension Calendar {
    
    /// formatter for short month and day of the week
    /// ex - Wed
    static let shorDayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "E"
        dateFormatter.isLenient = true
        
        return dateFormatter
    }()
    
    /// formatter for short month and day of the week
    /// ex - Wed
    static let shortMonthFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMM"
        dateFormatter.isLenient = true
        
        return dateFormatter
    }()
    
    /// formatter for short month and day of the week
    /// ex - Wed
    static let shortYearFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yy"
        dateFormatter.isLenient = true
        
        return dateFormatter
    }()
}

extension Calendar {
    func dateNumberComponents(from date: Date) -> (year: Int, month: Int, day: Int)? {
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
}

extension Calendar {
    func shortDescription(of date: Date,
                          for component: CalendarComponent) -> String {
        
        switch component {
        case .day:
            return Calendar.shorDayFormatter.string(from: date)
        case .month:
            return Calendar.shortMonthFormatter.string(from: date)
        case .year:
            return Calendar.shortYearFormatter.string(from: date)
        }
    }
}

enum CalendarComponent {
    case day
    case month
    case year
}
