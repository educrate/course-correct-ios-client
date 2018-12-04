//
//  UICalendarViewDay.swift
//  Client
//
//  Created by Christian Ampe on 9/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDay {
    
    /// date for extracting day of the week and day of the month
    let date: UICalendarViewDate
    
    /// events occurring during this day
    let events: [UICalendarViewEvent]
    
    init(date: UICalendarViewDate,
         events: [UICalendarViewEvent] = []) {
        
        self.date = date
        self.events = events
    }
}
