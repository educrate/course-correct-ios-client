//
//  UICalendarViewDay.swift
//  Client
//
//  Created by Christian Ampe on 9/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDay {
    
    /// Description for extracting information on the week and day of the month.
    let description: UICalendarViewDayDescription
    
    /// Events occurring during this day.
    let events: [UICalendarViewEvent]
    
    init(date: UICalendarViewDayDescription,
         events: [UICalendarViewEvent]) {
        
        self.description = date
        self.events = events
    }
}
