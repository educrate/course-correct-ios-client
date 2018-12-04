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
    
    init(calendar: Calendar) {
        self.calendar = calendar
    }
}

extension UICalendarViewHelper {
    func dateDescription(from dateComponents: UICalendarViewDateComponents) -> UICalendarViewDateDescription? {
        let calendarDate = date(from: dateComponents)
        let components = calendar.dateComponents([.weekday],
                                                 from: calendarDate)
        
        guard let weekdayComponent = components.weekday else {
            assertionFailure("internal inconsistency - issue extracting date component")
            return nil
        }
        
        return UICalendarViewDateDescription(calendar: calendar,
                                             dateComponents: dateComponents,
                                             weekdayComponent: weekdayComponent)
    }
    
    func days(month: Int, year: Int) -> Int {
        let monthDate = date(from: UICalendarViewDateComponents(day: 1, month: month, year: year))
        
        guard let dayRange = calendar.range(of: .day, in: .month, for: monthDate) else {
            assertionFailure("internal inconsistency - issue determining day range in month")
            return 0
        }
        
        return dayRange.count
    }
}

private extension UICalendarViewHelper {
    func date(from dateComponents: UICalendarViewDateComponents) -> Date {
        var components = DateComponents()
        
        components.day = dateComponents.day
        components.month = dateComponents.month
        components.year = dateComponents.year
        
        guard let date = calendar.date(from: components) else {
            assertionFailure("internal inconsistency - issue extracting date from components")
            return Date()
        }
        
        return date
    }
}

extension UICalendarViewHelper {
    static let secondsInAnHour: TimeInterval = 3600
    static let minutesInAnHour: TimeInterval = 60
}
