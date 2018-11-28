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

extension UICalendarViewDateIndex: Hashable {}

extension UICalendarViewDateIndex {
    static let reference = UICalendarViewDateIndex(day: 1, month: 1, year: 1970)
}
