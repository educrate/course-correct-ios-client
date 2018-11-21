//
//  UICalendarViewBrain.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewBrain {
    
    var dataSource: CalendarDataMapper
    var layoutCalculator: CalendarLayoutCalculator
    
    init(configuration: CalendarConfiguration) {
        let calendarHelper = CalendarHelper(configuration.calendar)
        let controllerDataSource = CalendarDataMapper(minimumCalendarYear: configuration.minimumCalendarYear,
                                                      maximumCalendarYear: configuration.maximumCalendarYear,
                                                      calendarHelper: calendarHelper)
        dataSource = controllerDataSource
        
        let calendarLayoutCalculator = CalendarLayoutCalculator(configuration.heightInPixelsOfOneHour)
        layoutCalculator = calendarLayoutCalculator
    }
}

extension UICalendarViewBrain {
    static let `default` = CalendarBrain(configuration: .default)
}
