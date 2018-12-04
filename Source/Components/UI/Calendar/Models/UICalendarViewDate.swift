//
//  UICalendarViewDate.swift
//  Client
//
//  Created by Christian Ampe on 9/25/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDate {
    let components: UICalendarViewDateComponents
    let descriptions: UICalendarViewDateDescription
    
    init(components: UICalendarViewDateComponents,
         descriptions: UICalendarViewDateDescription) {
        
        self.components = components
        self.descriptions = descriptions
    }
}

extension UICalendarViewDate: Equatable {
    static func == (lhs: UICalendarViewDate,
                    rhs: UICalendarViewDate) -> Bool {
        
        return lhs.components == rhs.components
    }
}
