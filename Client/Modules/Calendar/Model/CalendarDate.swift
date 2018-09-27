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
    
    let shortDayDescription: String
    let shortMonthDescription: String
    let shortYearDescription: String
    
    init?(_ aDate: Date) {
        guard let components = Calendar.current.dateNumberComponents(from: aDate) else {
            return nil
        }
        
        date = aDate
        
        day = components.day
        month = components.month
        year = components.year
        
        shortDayDescription = Calendar.current.shortDescription(of: date, for: .day)
        shortMonthDescription = Calendar.current.shortDescription(of: date, for: .month)
        shortYearDescription = Calendar.current.shortDescription(of: date, for: .year)
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
