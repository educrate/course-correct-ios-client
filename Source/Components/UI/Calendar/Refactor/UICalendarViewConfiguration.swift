//
//  UICalendarViewConfiguration.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewConfiguration {
    let calendar: Calendar
    let startDate: Date
    let minimumCalendarYear: Int
    let maximumCalendarYear: Int
    let heightInPixelsOfOneHour: Int
}

extension UICalendarViewConfiguration {
    static let `default`: UICalendarViewConfiguration = {
        let now = Date()
        let calendar = Calendar(identifier: .gregorian)
        let currentYear = calendar.component(.year, from: now)
        let yearSpread = 1
        
        return UICalendarViewConfiguration(calendar: .current,
                                           startDate: now,
                                           minimumCalendarYear: currentYear - yearSpread,
                                           maximumCalendarYear: currentYear + yearSpread,
                                           heightInPixelsOfOneHour: 30)
    }()
}

