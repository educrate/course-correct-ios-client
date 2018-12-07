//
//  UICalendarViewEvent.swift
//  Client
//
//  Created by Christian Ampe on 9/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

/// Model representing an event in the calendar.
struct UICalendarViewEvent {
    
    /// Main text for the associated event.
    let title: String
    
    /// Textual representation of the time this event occurs.
    let time: String
    
    /// Textual representation of where this event is to occur.
    let location: String
    
    /// Explicit initializer.
    ///
    /// - Parameters:
    ///   - title: Main text for the associated event.
    ///   - time: Textual representation of the time this event occurs.
    ///   - location: Textual representation of where this event is to occur.
    init(title: String,
         time: String,
         location: String) {
        
        self.title = title
        self.time = time
        self.location = location
    }
}
