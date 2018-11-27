//
//  UICalendarViewDate.swift
//  Client
//
//  Created by Christian Ampe on 9/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDate {
    let date: Date
    let dateIndex: UICalendarViewDateIndex
    
    init?(_ date: Date,
          calendarHelper: UICalendarViewHelper) {
       
        self.date = date
        self.dateIndex = UICalendarViewDateIndex(day: 1, month: 1, year: 2020)
    }
}

extension UICalendarViewDate: Equatable {
    static func == (lhs: UICalendarViewDate,
                    rhs: UICalendarViewDate) -> Bool {
        
        return lhs.dateIndex == rhs.dateIndex
    }
}

extension UICalendarViewDate: Hashable {}
