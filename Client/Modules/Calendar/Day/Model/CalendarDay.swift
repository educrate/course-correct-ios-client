//
//  CalendarDay.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import Foundation

public struct CalendarDay {
    
    /// date for extracting day of the week and day of the month
    public let date: Date
    
    /// events occurring during this day
    public let events: [CalendarEvent]
}
