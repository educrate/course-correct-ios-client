//
//  CalendarDate.swift
//  Client
//
//  Created by Ampe on 9/25/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

struct CalendarDate {
    private let date: Date
    
    let day: Int
    let month: Int
    let year: Int
    
    init?(_ date: Date) {
        guard let components = Calendar.current.dateFormatterComponents(from: date) else {
            return nil
        }
        
        self.date = date
        
        self.day = components.day
        self.month = components.month
        self.year = components.year
    }
}

extension CalendarDate: Equatable {
    static func == (lhs: CalendarDate,
                    rhs: CalendarDate) -> Bool {
        
        return
            lhs.day == rhs.day &&
            lhs.month == rhs.month &&
            lhs.year == rhs.year
    }
}

extension CalendarDate: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(day)
        hasher.combine(month)
        hasher.combine(year)
    }
}
