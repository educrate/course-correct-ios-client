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
    let earliestPossibleDateIndex: UICalendarViewDateIndex
    let latestPossibleDateIndex: UICalendarViewDateIndex
    
    init(calendar: Calendar = Calendar(identifier: .gregorian),
         earliestPossibleYear: Int = 2010,
         latestPossibleYear: Int = 2030) {
        
        self.calendar = calendar
        self.earliestPossibleDateIndex = UICalendarViewDateIndex(day: 1, month: 1, year: earliestPossibleYear)
        self.latestPossibleDateIndex = UICalendarViewDateIndex(day: 31, month: 12, year: latestPossibleYear)
    }
}

extension UICalendarViewDataConfiguration {
    static let `default` = UICalendarViewDataConfiguration()
}
