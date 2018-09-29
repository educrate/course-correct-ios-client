//
//  CalendarDate.swift
//  Client
//
//  Created by Ampe on 9/25/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

struct CalendarDate {
    let date: Date
    
    let dayNumber: Int
    let monthNumber: Int
    let yearNumber: Int
    
    let dayNumberString: String
    let monthNumberString: String
    let yearNumberString: String
    
    let weekdayShort: String
    let weekdayFull: String
    
    let monthShort: String
    let monthFull: String
    
    init?(_ aDate: Date,
          offset: DateOffsetHelper? = nil,
          calendar: Calendar,
          calendarHelper: CalendarHelper) {
        
        let numericalComponents = calendarHelper.numericalComponents(for: aDate,
                                                                     with: offset)
        
        let shortComponents = calendarHelper.shortDescriptions(for: aDate,
                                                               with: offset)
        
        let fullComponents = calendarHelper.descriptions(for: aDate,
                                                         with: offset)
        
        guard
            let numerical = numericalComponents,
            let short = shortComponents,
            let full = fullComponents
        else {
            return nil
        }
        
        date = aDate
        
        dayNumber = numerical.day
        monthNumber = numerical.month
        yearNumber = numerical.year
        
        dayNumberString = String(numerical.day)
        monthNumberString = String(numerical.month)
        yearNumberString = String(numerical.year)
        
        weekdayShort = short.weekday
        weekdayFull = full.weekday
        
        monthShort = full.month
        monthFull = full.month
    }
}

extension CalendarDate: Equatable {
    static func == (lhs: CalendarDate,
                    rhs: CalendarDate) -> Bool {
        
        return
            lhs.dayNumber == rhs.dayNumber &&
            lhs.monthNumber == rhs.monthNumber &&
            lhs.yearNumber == rhs.yearNumber
    }
}

extension CalendarDate: Hashable {
    
//    // formatted using the month day year values
//    // ex: 9/21/2018 -> 9212018
//    var hashValue: Int {
//        return month
//    }
}

