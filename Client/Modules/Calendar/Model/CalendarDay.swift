//
//  CalendarDay.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import Foundation

protocol CalendarDay {
    
    /// date for extracting day of the week and day of the month
    var date: CalendarDate { get }
    
    /// events occurring during this day
    var events: [CalendarEvent] { get }
}
