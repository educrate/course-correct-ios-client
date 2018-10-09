//
//  CalendarConfiguration.swift
//  Client
//
//  Created by Ampe on 9/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct CalendarConfiguration {
    let calendar: Calendar
    let startDate: Date
    let minimumCalendarYear: Int
    let maximumCalendarYear: Int
    let heightInPixelsOfOneHour: Int
}

extension CalendarConfiguration {
    static let `default`: CalendarConfiguration = {
        
        let now: Date = {
            let date = Date()
            return date
        }()
        
        let calendar: Calendar = {
            var calendar = Calendar(identifier: .gregorian)
            calendar.locale = Locale.current
            return calendar
        }()
        
        let currentYear = calendar.component(.year,
                                             from: now)
        
        let yearSpread = 1
        
        return CalendarConfiguration(calendar: .current,
                                     startDate: now,
                                     minimumCalendarYear: currentYear - yearSpread,
                                     maximumCalendarYear: currentYear + yearSpread,
                                     heightInPixelsOfOneHour: 30)
    }()
}
