//
//  UICalendarViewDateDescription.swift
//  Client
//
//  Created by Ampe on 11/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDateDescription {
    let dayValue: String
    let monthValue: String
    let yearValue: String
    let monthNameShort: String
    let monthName: String
    let dayNameShort: String
    let dayName: String
    
    init(calendar: Calendar,
         dateComponents: UICalendarViewDateComponents,
         weekdayComponent: Int) {
        
        self.dayValue = String(dateComponents.day)
        self.monthValue = String(dateComponents.month)
        self.yearValue = String(dateComponents.year)
        
        let monthSymbols = calendar.monthSymbols
        let monthSymbolsShort = calendar.shortMonthSymbols
        let weekdaySymbols = calendar.weekdaySymbols
        let weekdaySymbolsShort = calendar.shortWeekdaySymbols
        
        self.monthNameShort = monthSymbolsShort[dateComponents.month - 1]
        self.monthName = monthSymbols[dateComponents.month - 1]
        self.dayNameShort = weekdaySymbolsShort[weekdayComponent - 1]
        self.dayName = weekdaySymbols[weekdayComponent - 1]
    }
}
