//
//  DateDescriptor.swift
//  Client
//
//  Created by Ampe on 9/27/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

protocol DateDescriptor: Hashable {
    var date: Date { get }
    var day: Int { get }
    var month: Int { get }
    var year: Int { get }
    var weekdayShort: String { get }
    var weekdayFull: String { get }
    var monthShort: String { get }
    var monthFull: String { get }
}

extension DateDescriptor {
    static func == (lhs: Self,
                    rhs: Self) -> Bool {
        
        return
            lhs.day == rhs.day &&
            lhs.month == rhs.month &&
            lhs.year == rhs.year
    }
}

extension DateDescriptor {
    func hash(into hasher: inout Hasher) {
        hasher.combine(day)
        hasher.combine(month)
        hasher.combine(year)
    }
}

