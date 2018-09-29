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


class CalendarHelper {
    private let calendar: Calendar
    
    init(_ aCalendar: Calendar) {
        calendar = aCalendar
    }
}


// MARK: - Component Extractor Methods

extension CalendarHelper {
    func numericalComponents(for date: Date,
                             with offset: DateOffsetHelper? = nil) -> NumericalDateHelper? {
        
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
    
    func shortDescriptions(for date: Date,
                           with offset: DateOffsetHelper? = nil) -> DescriptionDateHelper? {
        
        guard let numericalDateComponents = numericalComponents(for: date,
                                                                with: offset)
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
    
    func descriptions(for date: Date,
                      with offset: DateOffsetHelper? = nil) -> DescriptionDateHelper? {
        
        guard let numericalDateComponents = numericalComponents(for: date,
                                                                with: offset)
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
    func date(for dayHelper: DayHelper) -> Date? {
        let components = DateComponents(calendar: calendar,
                                        year: dayHelper.year,
                                        month: dayHelper.month,
                                        day: dayHelper.day)
        
        guard let date = calendar.date(from: components) else {
            return nil
        }
        
        return date
    }
    
    func days(in month: Int,
              year: Int) -> Int? {
        
        var components = DateComponents(calendar: calendar,
                                        year: year,
                                        month: month)
        
        components.setValue(month + 1, for: .month)
        components.setValue(0, for: .day)
        
        guard let date = calendar.date(from: components) else {
            return nil
        }
        
        return calendar.component(.day, from: date)
    }
    
    func daysInMonth(for date: Date) -> Int? {
        
        guard let range = calendar.range(of: .day,
                                         in: .month,
                                         for: date)
        else {
            return nil
        }
    
        return range.count
    }
    
    func timeIntervalInMonth(for date: Date) -> TimeInterval? {
        return nil
    }
}
