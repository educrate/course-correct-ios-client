//
//  CalendarHelper.swift
//  Client
//
//  Created by Ampe on 9/25/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

typealias NumericalDateHelper =
    (day: Int,
    month: Int,
    year: Int,
    weekdayIndex: Int,
    monthIndex: Int)

typealias DescriptionDateHelper =
    (weekday: String,
    month: String)

typealias DateOffsetHelper =
    (component: Calendar.Component,
    value: Int)

typealias DayHelper =
    (day: Int,
    month: Int,
    year: Int)

typealias MonthHelper =
    (month: Int,
    year: Int)

class CalendarIndexMapper {
    let minimumCalendarYear: Int
    
    init(minimumCalendarYear minimumValue: Int) {
        minimumCalendarYear = minimumValue
    }
}

extension CalendarIndexMapper {
    func day(from indexPath: IndexPath) -> DayHelper {
        let monthRawIndex = indexPath.section
        let dayRawIndex = indexPath.row
        let monthRawCount = monthRawIndex + 1
        let monthIndexInCalendarYear = (monthRawCount % 12)
        let overrunYearCount = (monthRawCount / 12)
        let dayInCalendarMonth = dayRawIndex + 1
        let monthInCalendarYear = monthIndexInCalendarYear + 1
        let calendarYear = minimumCalendarYear + overrunYearCount
        
        return DayHelper(day: dayInCalendarMonth,
                         month: monthInCalendarYear,
                         year: calendarYear)
    }
}

class CalendarHelper {}


// MARK: - Component Extractor Methods

extension CalendarHelper {
    static func numericalComponents(for date: Date,
                                    with offset: DateOffsetHelper? = nil,
                                    from calendar: Calendar) -> NumericalDateHelper? {
        
        var date = date
        
        if let offset = offset, let offsetDate = calendar.date(byAdding: offset.component, value: offset.value, to: date) {
            date = offsetDate
        }
        
        let comp = calendar.dateComponents([.month,
                                            .day,
                                            .weekday,
                                            .year],
                                           from: date)
        
        guard
            let month = comp.month,
            let day = comp.day,
            let weekday = comp.weekday,
            let year = comp.year
        else {
            return nil
        }
        
        let monthIndex: Int = month - 1
        let weekdayIndex: Int = weekday - 1
        
        return
            (day: day,
             month: month,
             year: year,
             weekdayIndex: weekdayIndex,
             monthIndex: monthIndex)
    }
    
    static func shortDescriptions(for date: Date,
                                  with offset: DateOffsetHelper? = nil,
                                  from calendar: Calendar) -> DescriptionDateHelper? {
        
        guard let numericalDateComponents = numericalComponents(for: date,
                                                                with: offset,
                                                                from: calendar)
        else {
            return nil
        }
        
        guard
            calendar.shortWeekdaySymbols.indices.contains(numericalDateComponents.weekdayIndex),
            calendar.shortMonthSymbols.indices.contains(numericalDateComponents.monthIndex)
        else {
            return nil
        }
        
        let shortWeekdaySymbol = calendar.shortWeekdaySymbols[numericalDateComponents.weekdayIndex]
        let shortMonthSymbol = calendar.shortMonthSymbols[numericalDateComponents.monthIndex]
        
        return
            (shortWeekdaySymbol,
             shortMonthSymbol)
    }
    
    static func descriptions(for date: Date,
                             with offset: DateOffsetHelper? = nil,
                             from calendar: Calendar) -> DescriptionDateHelper? {
        
        guard let numericalDateComponents = numericalComponents(for: date,
                                                                with: offset,
                                                                from: calendar)
        else {
            return nil
        }
        
        guard
            calendar.weekdaySymbols.indices.contains(numericalDateComponents.weekdayIndex),
            calendar.monthSymbols.indices.contains(numericalDateComponents.monthIndex)
        else {
            return nil
        }
        
        let weekdaySymbol = calendar.weekdaySymbols[numericalDateComponents.weekdayIndex]
        let monthSymbol = calendar.monthSymbols[numericalDateComponents.monthIndex]
        
        return
            (weekdaySymbol,
             monthSymbol)
    }
}

// MARK: Month Range Helpers
extension CalendarHelper {
    func daysInMonth(for date: Date,
                     from calendar: Calendar) -> Int? {
        
        guard let range = calendar.range(of: .day,
                                         in: .month,
                                         for: date)
        else {
            return nil
        }
    
        return range.count
    }
    
    func timeIntervalInMonth(for date: Date,
                             from calendar: Calendar) -> TimeInterval? {
        return nil
    }
}
