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
    let startDateIndex: UICalendarViewDateIndex
    let heightInPixelsOfOneHour: Int
    let cellConfiguration: UICalendarViewCellConfguration
    
    init(calendar: Calendar = Calendar(identifier: .gregorian),
         startDateIndex: UICalendarViewDateIndex = .earliestDateIndex,
         heightInPixelsOfOneHour: Int = 30,
         cellConfiguration: UICalendarViewCellConfguration = .default) {
        
        self.calendar = calendar
        self.startDateIndex = startDateIndex
        self.heightInPixelsOfOneHour = heightInPixelsOfOneHour
        self.cellConfiguration = cellConfiguration
    }
}

extension UICalendarViewConfiguration {
    static let `default` = UICalendarViewConfiguration()
}
