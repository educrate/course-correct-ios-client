//
//  UICalendarViewDateHelper.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewDateHelper {
    private let calendar: Calendar
    
    init(calendar: Calendar) {
        self.calendar = calendar
    }
}

extension UICalendarViewDateHelper {
    func dateDescription(from indices: UICalendarViewDateIndex) -> UICalendarViewDateDescription {
        let calendarDate = date(from: indices)
        let components = calendar.dateComponents([.weekday],
                                                 from: calendarDate)
        
        guard let weekdayIndex = components.weekday else {
            assertionFailure("internal inconsistency - issue extracting date component")
            return .epoch
        }
        
        return UICalendarViewDateDescription(calendar: calendar,
                                             dateIndex: indices,
                                             weekdayIndex: weekdayIndex - 1)
    }
    
    func days(month: Int, year: Int) -> Int {
        let monthDate = date(from: UICalendarViewDateIndex(day: 1, month: month, year: year))
        
        guard let dayRange = calendar.range(of: .day, in: .month, for: monthDate) else {
            assertionFailure("internal inconsistency - issue determining day range in month")
            return 0
        }
        
        return dayRange.count
    }
}

private extension UICalendarViewDateHelper {
    func date(from dateIndex: UICalendarViewDateIndex) -> Date {
        var components = DateComponents()
        
        components.day = dateIndex.day + 1
        components.month = dateIndex.month + 1
        components.year = dateIndex.year + 1
        
        guard let date = calendar.date(from: components) else {
            assertionFailure("internal inconsistency - issue extracting date from components")
            return Date()
        }
        
        return date
    }
}

extension UICalendarViewDateHelper {
    static let secondsInAnHour: TimeInterval = 3600
    static let minutesInAnHour: TimeInterval = 60
}
