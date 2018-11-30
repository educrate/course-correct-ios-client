//
//  UICalendarViewEvent.swift
//  Client
//
//  Created by Christian Ampe on 9/11/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UICalendarViewEvent {
    let title: String
    let time: String
    let location: String
    
    init(title: String,
         time: String,
         location: String) {
        
        self.title = title
        self.time = time
        self.location = location
    }
}
