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
    
    init(date: Date,
         helper: UICalendarViewHelper) {
       
        self.date = date
        self.dateIndex = helper.dateIndex(from: date)
    }
    
    init(dateIndex: UICalendarViewDateIndex,
         helper: UICalendarViewHelper) {
        
        self.date = helper.date(from: dateIndex)
        self.dateIndex = dateIndex
    }
}

extension UICalendarViewDate: Equatable {
    static func == (lhs: UICalendarViewDate,
                    rhs: UICalendarViewDate) -> Bool {
        
        return lhs.dateIndex == rhs.dateIndex
    }
}

extension UICalendarViewDate: Hashable {}
