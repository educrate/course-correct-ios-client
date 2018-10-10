//
//  CalendarDay.swift
//  UICalendar
//
//  Created by Ampe on 9/11/18.
//

import Foundation

struct CalendarDay {
    
    /// date for extracting day of the week and day of the month
    let date: CalendarDate
    
    /// events occurring during this day
    let events: [CalendarEvent]
}
