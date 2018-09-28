//
//  CalendarHelper.swift
//  Client
//
//  Created by Ampe on 9/25/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

class CalendarHelper {
    typealias NumericalDateHelper =
        (day: Int,
        month: Int,
        year: Int,
        weekdayIndex: Int,
        monthIndex: Int)
    
    typealias DescriptionDateHelper =
        (weekday: String,
        month: String)
}

extension CalendarHelper {
    static func numericalComponents(for date: Date,
                                    from calendar: Calendar) -> NumericalDateHelper? {
        
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
                                  from calendar: Calendar) -> DescriptionDateHelper? {
        
        guard let numericalDateComponents = numericalComponents(for: date,
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
                             from calendar: Calendar) -> DescriptionDateHelper? {
        
        guard let numericalDateComponents = numericalComponents(for: date,
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
