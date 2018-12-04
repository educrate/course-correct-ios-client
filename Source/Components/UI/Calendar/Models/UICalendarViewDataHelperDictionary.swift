//
//  UICalendarViewDataHelperDictionary.swift
//  Client
//
//  Created by Ampe on 12/1/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewDataHelperDictionary {
    
    // MARK: Properties
    
    /// Storage of date descriptions based on a year, month, day component structure
    /// Example: [2018: [7: [24: (Description of July 24th 2018)]]]
    private var cache: [Int: [Int: [Int: UICalendarViewDateDescription]]]
    
    // MARK: Initializer
    
    init(_ cache: [Int: [Int: [Int: UICalendarViewDateDescription]]] = [:]) {
        self.cache = cache
    }
}

extension UICalendarViewDataHelperDictionary {
    
    func totalFullYears() -> Int {
        guard
            let earliestYear = earliestYear(),
            let latestYear = latestYear()
        else {
            return 0
        }
        
        return latestYear - earliestYear
    }
    
    /// Computes the total number of months in the cache
    ///
    /// - Returns: Integer value of the number of months
    func totalMonths() -> Int {
        guard
            let earliestYear = earliestYear(),
            let latestYear = latestYear()
        else {
            return 0
        }
        
        let yearDelta = latestYear - earliestYear
        
        guard let monthsInLatestYearDictionary = monthsDictionary(latestYear) else {
            return yearDelta * 12
        }
        
        return (yearDelta * 12) + monthsInLatestYearDictionary.count
    }
    
    /// Computes earliest year in the cache
    ///
    /// - Returns: Optional integer value of the earliest loaded year from the cache
    func earliestYear() -> Int? {
        return cache.keys.min()
    }
    
    func earliestMonth() -> (year: Int, month: Int)? {
        guard
            let earliestYear = earliestYear(),
            let monthsDictionary = monthsDictionary(earliestYear),
            let earliestMonth = monthsDictionary.keys.min()
        else {
            return nil
        }
        
        return (year: earliestYear, month: earliestMonth)
    }
    
    func earliestDay() -> (year: Int, month: Int, day: Int)? {
        guard
            let earliestMonth = earliestMonth(),
            let daysDictionary = daysDictionary(earliestMonth.year, earliestMonth.month),
            let earliestDay = daysDictionary.keys.min()
        else {
            return nil
        }
        
        return (year: earliestMonth.year, month: earliestMonth.month, day: earliestDay)
    }
    
    /// Computes latest year in the cache
    ///
    /// - Returns: Optional integer value of the latest loaded year from the cache
    func latestYear() -> Int? {
        return cache.keys.max()
    }
    
    func latestMonth() -> (year: Int, month: Int)? {
        guard
            let latestYear = latestYear(),
            let monthsDictionary = monthsDictionary(latestYear),
            let latestMonth = monthsDictionary.keys.max()
        else {
            return nil
        }
        
        return (year: latestYear, month: latestMonth)
    }
    
    func latestDay() -> (year: Int, month: Int, day: Int)? {
        guard
            let latestMonth = latestMonth(),
            let daysDictionary = daysDictionary(latestMonth.year, latestMonth.month),
            let latestDay = daysDictionary.keys.max()
        else {
            return nil
        }
        
        return (year: latestMonth.year, month: latestMonth.month, day: latestDay)
    }
}

private extension UICalendarViewDataHelperDictionary {
    func monthsDictionary(_ year: Int) -> [Int: [Int: UICalendarViewDateDescription]]? {
        return cache[year]
    }
    
    func daysDictionary(_ year: Int, _ month: Int) -> [Int: UICalendarViewDateDescription]? {
        return cache[year]?[month]
    }
    
    func day(_ year: Int, _ month: Int, _ day: Int) -> UICalendarViewDateDescription? {
        return cache[year]?[month]?[day]
    }
}

extension UICalendarViewDataHelperDictionary {
    mutating func set(_ description: UICalendarViewDateDescription,
                      for components: UICalendarViewDateComponents) {
        
        guard let _ = monthsDictionary(components.year) else {
            return
        }
        
        guard let _ = daysDictionary(components.year, components.month) else {
            return
        }
        
        guard let _ = day(components.year, components.month, components.day) else {
            return
        }
        
        cache[components.year]![components.month]![components.day]! = description
    }
}
