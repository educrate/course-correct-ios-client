//
//  CalendarConfiguration.swift
//  Client
//
//  Created by Ampe on 9/29/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

struct CalendarConfiguration {
    let calendar: Calendar
    let startDate: Date
    let minimumCalendarYear: Int
    let maximumCalendarYear: Int
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
        
        let fiveYearsBeforeNow = calendar.date(byAdding: .year,
                                               value: -5,
                                               to: now)
        
        let yearFiveYearsAgo = calendar.component(.year, from: fiveYearsBeforeNow!)
        
        let fiveYearsFromNow = calendar.date(byAdding: .year,
                                             value: 5,
                                             to: now)
        
        let yearInFiveYears = calendar.component(.year, from: fiveYearsFromNow!)
        
        return CalendarConfiguration(calendar: .current,
                                     startDate: now,
                                     minimumCalendarYear: yearFiveYearsAgo,
                                     maximumCalendarYear: yearInFiveYears)
    }()
}
