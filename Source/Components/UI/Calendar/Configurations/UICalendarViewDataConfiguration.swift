//
//  UICalendarViewDataConfiguration.swift
//  Client
//
//  Created by Ampe on 11/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDataConfiguration {
    let calendar: Calendar
    let earliestPossibleDateIndex: UICalendarViewDateComponents
    let latestPossibleDateIndex: UICalendarViewDateComponents
    
    init(calendar: Calendar = Calendar(identifier: .gregorian),
         locale: Locale = .current,
         earliestPossibleYear: Int = 2010,
         latestPossibleYear: Int = 2030) {
        
        var calendar = calendar
        calendar.locale = locale
        
        self.calendar = calendar
        self.earliestPossibleDateIndex = UICalendarViewDateComponents(day: 1, month: 1, year: earliestPossibleYear)
        self.latestPossibleDateIndex = UICalendarViewDateComponents(day: 31, month: 12, year: latestPossibleYear)
    }
}

extension UICalendarViewDataConfiguration {
    static let `default` = UICalendarViewDataConfiguration()
}
