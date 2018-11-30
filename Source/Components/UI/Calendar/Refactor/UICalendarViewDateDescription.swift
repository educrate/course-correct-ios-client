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
         dateIndex: UICalendarViewDateIndex,
         weekdayIndex: Int) {
        
        self.dayValue = String(dateIndex.day)
        self.monthValue = String(dateIndex.month)
        self.yearValue = String(dateIndex.year)
        
        let monthSymbols = calendar.monthSymbols
        let monthSymbolsShort = calendar.shortMonthSymbols
        let weekdaySymbols = calendar.weekdaySymbols
        let weekdaySymbolsShort = calendar.shortWeekdaySymbols
        
        self.monthNameShort = monthSymbolsShort[dateIndex.month]
        self.monthName = monthSymbols[dateIndex.month]
        self.dayNameShort = weekdaySymbols[weekdayIndex]
        self.dayName = weekdaySymbolsShort[weekdayIndex]
    }
}

extension UICalendarViewDateDescription {
    static let epoch = UICalendarViewDateDescription(calendar: .current, dateIndex: .epoch, weekdayIndex: 3)
}
