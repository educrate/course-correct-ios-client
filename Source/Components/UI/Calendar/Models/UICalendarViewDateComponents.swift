//
//  UICalendarViewDateComponents.swift
//  Client
//
//  Created by Ampe on 11/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDateComponents {
    let day: Int
    let month: Int
    let year: Int
    
    init(day: Int,
         month: Int,
         year: Int) {
        
        self.day = day
        self.month = month
        self.year = year
    }
}

extension UICalendarViewDateComponents: Hashable {
    var hashValue: Int {
        guard let integer = Int("\(year)\(month)\(day)") else {
            assertionFailure("internal inconsistency - issue mapping string to integer")
            return -1
        }
        
        return integer
    }
}

extension UICalendarViewDateComponents: Comparable {
    static func < (lhs: UICalendarViewDateComponents, rhs: UICalendarViewDateComponents) -> Bool {
        return lhs.hashValue < rhs.hashValue
    }
}
