//
//  CalendarController.swift
//  Client
//
//  Created by Ampe on 9/29/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

class CalendarBrain {
    
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

extension CalendarBrain {
    static let `default` = CalendarBrain(configuration: .default)
}
