//
//  CalendarController.swift
//  Client
//
//  Created by Ampe on 9/29/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

class CalendarController {
    
    var dataSource: CalendarSetupDataSource
    
    init(configuration: CalendarConfiguration) {
        let calendarHelper = CalendarHelper(configuration.calendar)
        let controllerDataSource = CalendarSetupDataSource(minimumCalendarYear: configuration.minimumCalendarYear,
                                                          maximumCalendarYear: configuration.maximumCalendarYear,
                                                          calendarHelper: calendarHelper)
        dataSource = controllerDataSource
    }
    
}
