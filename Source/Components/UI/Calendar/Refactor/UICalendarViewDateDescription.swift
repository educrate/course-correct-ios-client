//
//  UICalendarViewDateDescription.swift
//  Client
//
//  Created by Ampe on 11/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDateDescription {
    let dateIndex: UICalendarViewDateIndex
    let weekdayIndex: Int
    
    init(dateIndex: UICalendarViewDateIndex,
         weekdayIndex: Int) {
        
        self.dateIndex = dateIndex
        self.weekdayIndex = weekdayIndex
    }
}

extension UICalendarViewDateDescription {
    static let epoch = UICalendarViewDateDescription(dateIndex: .epoch, weekdayIndex: 3)
}
