//
//  UICalendarViewDate.swift
//  Client
//
//  Created by Christian Ampe on 9/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDate {
    private let helper: UICalendarViewDateHelper
    private let indices: UICalendarViewDateComponents
    
    private let _descriptions = LazyBox<UICalendarViewDate, UICalendarViewDateDescription> { date in
        return date.helper.dateDescription(from: date.indices)
    }
    
    var descriptions: UICalendarViewDateDescription {
        return _descriptions.value(input: self)
    }
    
    init(helper: UICalendarViewDateHelper,
         indices: UICalendarViewDateComponents) {
        
        self.helper = helper
        self.indices = indices
    }
}

extension UICalendarViewDate: Equatable {
    static func == (lhs: UICalendarViewDate,
                    rhs: UICalendarViewDate) -> Bool {
        
        return lhs.indices == rhs.indices
    }
}
