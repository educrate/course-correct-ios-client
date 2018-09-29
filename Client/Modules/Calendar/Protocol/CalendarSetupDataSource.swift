//
//  CalendarSetupDataSource.swift
//  Client
//
//  Created by Ampe on 9/29/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

class CalendarSetupDataSource {
    private var minYear: Int
    private var maxYear: Int
    private var helper: CalendarHelper
    
    init(minimumCalendarYear: Int,
         maximumCalendarYear: Int,
         calendarHelper: CalendarHelper) {
        
        minYear = minimumCalendarYear
        maxYear = maximumCalendarYear
        helper = calendarHelper
    }
}

extension CalendarSetupDataSource {
    
    /// Essentially a number of sections mapper
    ///
    /// - Returns: Returns number of months from setup calendar.
    func monthCount() -> Int {
        let yearCount = maxYear - minYear
        let monthCount = yearCount * 12
        
        return monthCount
    }
    
    func days(in monthIndex: Int) -> Int? {
        let calendarMonth = month(from: monthIndex)
        let calendarYear = year(from: monthIndex)
        
        return helper.days(in: calendarMonth,
                           year: calendarYear)
    }
    
    func calendarDate(for dayHelper: DayHelper) -> CalendarDate? {
        guard let calendarDate = CalendarDate(dayHelper,
                                              calendarHelper: helper)
        else {
            return nil
        }
        
        return calendarDate
    }
    
    /// Extracts a fully formed day helper from an index path.
    /// Essentially a cell for row at index path mapper
    ///
    /// - Parameter indexPath: Value returned from a table view data source.
    /// - Returns: A human readable date structure containing the respective calendar components.
    func day(from indexPath: IndexPath) -> DayHelper {
        let monthRawIndex = indexPath.section
        let dayRawIndex = indexPath.row
        let monthRawCount = monthRawIndex + 1
        let calendarDay = dayRawIndex + 1
        let calendarMonth = month(from: monthRawCount)
        let calendarYear = year(from: monthRawCount)
        
        return DayHelper(day: calendarDay,
                         month: calendarMonth,
                         year: calendarYear)
    }
}

private extension CalendarSetupDataSource {
    func month(from monthCount: Int) -> Int {
        let monthIndexInCalendarYear = (monthCount % 12)
        let monthInCalendarYear = monthIndexInCalendarYear + 1
        
        return monthInCalendarYear
    }
    
    func year(from monthCount: Int) -> Int {
        let overrunYearCount = (monthCount / 12)
        let calendarYear = minYear + overrunYearCount
        
        return calendarYear
    }
}
    

