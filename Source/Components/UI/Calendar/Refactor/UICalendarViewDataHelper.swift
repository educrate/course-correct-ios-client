//
//  UICalendarViewDataHelper.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewDataHelper {
    private let helper: UICalendarViewHelper
    private var currentDateIndex: UICalendarViewDateIndex
    private var daysInCurrentMonth: Int
    private var data: [Int: UICalendarViewDay]
    
    init(helper: UICalendarViewHelper,
         startDateIndex: UICalendarViewDateIndex) {
        
        self.helper = helper
        self.currentDateIndex = startDateIndex
        self.daysInCurrentMonth = helper.days(month: startDateIndex.month, year: startDateIndex.year)
        self.data = [:]
    }
}

extension UICalendarViewDataHelper {
    func yesterday() -> UICalendarViewDay {
        let previousIndex = previousDateIndex(from: currentDateIndex)
        updateIndex(to: previousIndex)
        
        let yesterday = day(for: previousIndex)
        cache(yesterday)
        
        return yesterday
    }
    
    func tomorrow() -> UICalendarViewDay {
        let nextIndex = nextDateIndex(from: currentDateIndex)
        updateIndex(to: nextIndex)
        
        let tomorrow = day(for: nextIndex)
        cache(tomorrow)
        
        return tomorrow
    }
}

private extension UICalendarViewDataHelper {
    func previousDateIndex(from referenceDateIndex: UICalendarViewDateIndex) -> UICalendarViewDateIndex {
        
        // ensure we do not have any out of bounds day values
        assert(referenceDateIndex.day > 0 && referenceDateIndex.day <= daysInCurrentMonth, "internal inconsistency - issue handling number of days in a month")
        
        // previous day on the first day of the month requires looking at the previous month
        if referenceDateIndex.day == 1 {
            
            // ensure we do not have any out of bounds month values
            assert(referenceDateIndex.month > 0 && referenceDateIndex.month <= 12, "internal inconsistency - issue handling number of days in a month")
            
            // previous day on the first day of the first month of the year requires looking at the previous year
            // update days in current month
            // decrement year value by one and set month value to 12 and set day value to number of days in current month
            if referenceDateIndex.month == 1 {
                let newYear = referenceDateIndex.year - 1
                let newMonth = 12
                let newDay = helper.days(month: newMonth, year: newYear)
                
                daysInCurrentMonth = newDay
                
                return UICalendarViewDateIndex(day: newDay, month: newMonth, year: newYear)
                
                // decrement month value by one and set day value to number of days in current month
            } else if referenceDateIndex.month > 1, referenceDateIndex.month <= 12 {
                let currentYear = referenceDateIndex.year
                let newMonth = 12
                let newDay = helper.days(month: newMonth, year: currentYear)
                
                daysInCurrentMonth = newDay
                
                return UICalendarViewDateIndex(day: newDay, month: newMonth, year: currentYear)
                
                // issue with handling number of months in year
            } else {
                assertionFailure("internal inconsistency - issue handling number of months in a year")
                return .reference
            }
            
            // decrement day value by one
        } else if referenceDateIndex.day > 1, referenceDateIndex.day <= daysInCurrentMonth {
            let currentYear = referenceDateIndex.year
            let currentMonth = referenceDateIndex.month
            let newDay = referenceDateIndex.day - 1
            
            return UICalendarViewDateIndex(day: newDay, month: currentMonth, year: currentYear)
            
            // issue with handling number of days in a month
        } else {
            assertionFailure("internal inconsistency - issue handling number of days in a month")
            return .reference
        }
    }
    
    func nextDateIndex(from referenceDateIndex: UICalendarViewDateIndex) -> UICalendarViewDateIndex {
        
        // ensure we do not have any out of bounds day values
        assert(referenceDateIndex.day > 0 && referenceDateIndex.day <= daysInCurrentMonth, "internal inconsistency - issue handling number of days in a month")
        
        // next day on the last day of the month requires looking at the next month
        if referenceDateIndex.day == daysInCurrentMonth {
            
            // ensure we do not have any out of bounds month values
            assert(referenceDateIndex.month > 0 && referenceDateIndex.month <= 12, "internal inconsistency - issue handling number of days in a month")
            
            // next day on the last day of the month requires looking at the next year
            // increment year value by one and set month value to 1 and set day value to 1
            if referenceDateIndex.month == 12 {
                let newYear = referenceDateIndex.year + 1
                let newMonth = 1
                let newDay = 1
                
                daysInCurrentMonth = helper.days(month: newMonth, year: newYear)
                
                return UICalendarViewDateIndex(day: newDay, month: newMonth, year: newYear)
                
                // increment month value by one and set day value to 1
            } else if referenceDateIndex.month > 0, referenceDateIndex.month < 12 {
                let currentYear = referenceDateIndex.year
                let newMonth = referenceDateIndex.month + 1
                let newDay = 1
                
                daysInCurrentMonth = helper.days(month: newMonth, year: currentYear)
                
                return UICalendarViewDateIndex(day: newDay, month: newMonth, year: currentYear)
                
                // issue with handling number of months in year
            } else {
                assertionFailure("internal inconsistency - issue handling number of months in a year")
                return .reference
            }
            
            // increment day value by one
        } else if referenceDateIndex.day > 0, referenceDateIndex.day < daysInCurrentMonth {
            let currentYear = referenceDateIndex.year
            let currentMonth = referenceDateIndex.month
            let newDay = referenceDateIndex.day + 1
            
            return UICalendarViewDateIndex(day: newDay, month: currentMonth, year: currentYear)
            
            // issue with handling number of days in a month
        } else {
            assertionFailure("internal inconsistency - issue handling number of days in a month")
            return .reference
        }
    }
}

private extension UICalendarViewDataHelper {
    func day(for index: UICalendarViewDateIndex) -> UICalendarViewDay {
        guard let day = data[index.hashValue] else {
            return UICalendarViewDay(date: UICalendarViewDate(dateIndex: index, helper: helper))
        }
        
        return day
    }
}

private extension UICalendarViewDataHelper {
    func updateIndex(to newIndex: UICalendarViewDateIndex) {
        currentDateIndex = newIndex
    }
    
    func cache(_ day: UICalendarViewDay) {
        data[day.date.dateIndex.hashValue] = day
    }
}

extension UICalendarViewDataHelper {
    func numberOfMonths() -> Int {
        return 1
    }
    
    func numberOfDays(in month: Int) -> Int {
        return 10
    }
}
