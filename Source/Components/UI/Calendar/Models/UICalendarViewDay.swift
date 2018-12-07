//
//  UICalendarViewDay.swift
//  Client
//
//  Created by Christian Ampe on 9/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

/// Model containing information for a single calendar day.
struct UICalendarViewDay {
    
    /// Description for extracting information on the week and day of the month.
    let description: UICalendarViewDayDescription
    
    /// Events occurring during this day.
    let events: [UICalendarViewEvent]
    
    /// Explicit initializer.
    ///
    /// - Parameters:
    ///   - description: Description of a single day.
    ///   - events: Events associated with the day description.
    init(description: UICalendarViewDayDescription,
         events: [UICalendarViewEvent]) {
        
        self.description = description
        self.events = events
    }
}
