//
//  UICalendarViewDateIndex.swift
//  Client
//
//  Created by Ampe on 11/26/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDateIndex {
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

extension UICalendarViewDateIndex: Hashable {
    var hashValue: Int {
        guard let integer = Int("\(year)\(month)\(day)") else {
            assertionFailure("internal inconsistency - issue mapping string to integer")
            return -1
        }
        
        return integer
    }
}

extension UICalendarViewDateIndex: Comparable {
    static func < (lhs: UICalendarViewDateIndex, rhs: UICalendarViewDateIndex) -> Bool {
        return lhs.hashValue < rhs.hashValue
    }
}

extension UICalendarViewDateIndex {
    static let earliestDateIndex = UICalendarViewDateIndex(day: 1, month: 1, year: 2010)
    static let latestDateIndex = UICalendarViewDateIndex(day: 31, month: 12, year: 2029)
}
