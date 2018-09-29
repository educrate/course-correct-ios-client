//
//  CalendarConfiguration.swift
//  Client
//
//  Created by Ampe on 9/29/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

struct CalendarConfiguration {
    let minimumCalendarYear: Int
    let maximumCalendarYear: Int
    let calendar: Calendar
}

extension CalendarConfiguration {
    static let `default` = CalendarConfiguration(minimumCalendarYear: 2015,
                                                 maximumCalendarYear: 2023,
                                                 calendar: .current)
}
