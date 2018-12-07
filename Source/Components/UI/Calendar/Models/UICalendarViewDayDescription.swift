//
//  UICalendarViewDayDescription.swift
//  Client
//
//  Created by Christian Ampe on 9/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

/// Model containing information about the
/// localized values of a single date.
struct UICalendarViewDayDescription {
    
    /// Value of the day in the associated month.
    let day: Int
    
    /// Value of the month in the associated year.
    let month: Int
    
    /// Value of the year for the associated day.
    let year: Int
    
    /// Textual representation of the day value.
    let dayValue: String
    
    /// Short name for the associated weekday.
    /// Ex - Tuesday -> Tue.
    let dayNameShort: String
    
    /// Textual representation of the month value.
    let monthValue: String
    
    /// Short name for the associated month.
    /// Ex - January -> Jan.
    let monthNameShort: String
    
    /// Full name for the associated month.
    let monthName: String
    
    /// Textual representation of the year value.
    let yearValue: String
    
    /// Explicit initializer.
    ///
    /// - Parameters:
    ///   - day: Value of the day in the associated month.
    ///   - month: Value of the month in the associated year.
    ///   - year: Value of the year for the associated day.
    ///   - dayNameShort: Short name for the associated weekday.
    ///   - monthNameShort: Short name for the associated month.
    ///   - monthName: Full name for the associated month.
    init(day: Int,
         month: Int,
         year: Int,
         dayNameShort: String,
         monthNameShort: String,
         monthName: String) {
        
        self.day = day
        self.month = month
        self.year = year
        self.dayNameShort = dayNameShort
        self.monthNameShort = monthNameShort
        self.monthName = monthName
        self.dayValue = String(day)
        self.monthValue = String(month)
        self.yearValue = String(year)
    }
}
