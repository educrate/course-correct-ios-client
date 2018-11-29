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
    private let helper: UICalendarViewDateHelper
    
    private let _indices = LazyBox<UICalendarViewDate, UICalendarViewDateIndex> { date in
        return date.helper.dateIndex(from: date.date)
    }
    
    private let _descriptions = LazyBox<UICalendarViewDate, UICalendarViewDateDescription> { date in
        return date.helper.dateDescription(from: date.date, indices: date.indices)
    }
    
    var indices: UICalendarViewDateIndex {
        return _indices.value(input: self)
    }
    
    var descriptions: UICalendarViewDateDescription {
        return _descriptions.value(input: self)
    }
    
    init(date: Date,
         helper: UICalendarViewDateHelper) {
        
        self.date = date
        self.helper = helper
    }
}

extension UICalendarViewDate: Equatable {
    static func == (lhs: UICalendarViewDate,
                    rhs: UICalendarViewDate) -> Bool {
        
        return lhs.indices == rhs.indices
    }
}
