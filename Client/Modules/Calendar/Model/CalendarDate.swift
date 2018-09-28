//
//  CalendarDate.swift
//  Client
//
//  Created by Ampe on 9/25/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

struct CalendarDate: DateDescriptor {
    let date: Date
    let day: Int
    let month: Int
    let year: Int
    let weekdayShort: String
    let weekdayFull: String
    let monthShort: String
    let monthFull: String
    
    init?(_ aDate: Date,
          calendar: Calendar) {
        let numericalComponents = CalendarHelper.numericalComponents(for: aDate,
                                                                     from: calendar)
        
        let shortComponents = CalendarHelper.shortDescriptions(for: aDate,
                                                               from: calendar)
        
        let fullComponents = CalendarHelper.descriptions(for: aDate,
                                                         from: calendar)
        
        guard
            let numerical = numericalComponents,
            let short = shortComponents,
            let full = fullComponents
            else {
                return nil
        }
        
        date = aDate
        day = numerical.day
        month = numerical.month
        year = numerical.year
        weekdayShort = short.weekday
        weekdayFull = full.weekday
        monthShort = full.month
        monthFull = full.month
    }
}
