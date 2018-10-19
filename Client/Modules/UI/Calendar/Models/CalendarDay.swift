//
//  CalendarDay.swift
//  Client
//
//  Created by Christian Ampe on 9/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct CalendarDay {
    
    /// date for extracting day of the week and day of the month
    let date: CalendarDate
    
    /// events occurring during this day
    let events: [CalendarEvent]
}
