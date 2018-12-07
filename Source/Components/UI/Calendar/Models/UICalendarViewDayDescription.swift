//
//  UICalendarViewDayDescription.swift
//  Client
//
//  Created by Christian Ampe on 9/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDayDescription {
    let day: Int
    let month: Int
    let year: Int
    let dayValue: String
    let dayNameShort: String
    let monthValue: String
    let monthNameShort: String
    let monthName: String
    let yearValue: String
    
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
