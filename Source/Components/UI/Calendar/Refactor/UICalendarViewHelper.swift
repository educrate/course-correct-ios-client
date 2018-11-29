//
//  UICalendarViewHelper.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewHelper {
    private let calendar: Calendar
    
    init(_ calendar: Calendar) {
        self.calendar = calendar
    }
}

extension UICalendarViewHelper {
    func dateIndex(from date: Date) -> UICalendarViewDateIndex {
        let components = calendar.dateComponents([.day,
                                                  .month,
                                                  .year],
                                                 from: date)
        
        guard
            let dayIndex = components.day,
            let monthIndex = components.month,
            let yearIndex = components.year
        else {
            assertionFailure("internal inconsistency - issue extracting date component")
            return .earliestDateIndex
        }
        
        return UICalendarViewDateIndex(day: dayIndex,
                                       month: monthIndex,
                                       year: yearIndex)
    }
    
    func date(from dateIndex: UICalendarViewDateIndex) -> Date {
        var components = DateComponents()
        
        components.day = dateIndex.day
        components.month = dateIndex.month
        components.year = dateIndex.year
        
        guard let date = calendar.date(from: components) else {
            assertionFailure("internal inconsistency - issue extracting date from components")
            return Date()
        }
        
        return date
    }
    
    func days(month: Int, year: Int) -> Int {
        return days(for: date(from: UICalendarViewDateIndex(day: 1, month: month, year: year)))
    }
    
    func days(for monthDate: Date) -> Int {
        guard let dayRange = calendar.range(of: .day, in: .month, for: monthDate) else {
            assertionFailure("internal inconsistency - issue determining day range in month")
            return 0
        }
        
        return dayRange.count
    }
}

extension UICalendarViewHelper {
    static let secondsInAnHour: TimeInterval = 3600
    static let minutesInAnHour: TimeInterval = 60
}
