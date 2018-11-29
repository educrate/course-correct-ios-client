//
//  UICalendarViewDataHelper.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewDataHelper {
    private let helper: UICalendarViewDateHelper
    private let earliestPossibleDateIndex: UICalendarViewDateIndex
    private let latestPossibleDateIndex: UICalendarViewDateIndex
    
    init(helper: UICalendarViewDateHelper,
         earliestPossibleDateIndex: UICalendarViewDateIndex,
         latestPossibleDateIndex: UICalendarViewDateIndex) {
        
        self.helper = helper
        self.earliestPossibleDateIndex = earliestPossibleDateIndex
        self.latestPossibleDateIndex = latestPossibleDateIndex
    }
}

extension UICalendarViewDataHelper {
    func months() -> Int {
        let yearDelta = latestPossibleDateIndex.year - earliestPossibleDateIndex.year
        let monthsInYearDelta = yearDelta * 12
        let monthsInFinalYear = latestPossibleDateIndex.month
        return monthsInYearDelta + monthsInFinalYear
    }
    
    func days(in section: Int) -> Int {
        let years = fullYears(from: section)
        let year = earliestPossibleDateIndex.year + years
        let months = monthsInFinalYear(from: section)
        let month = earliestPossibleDateIndex.month + months
        return helper.days(month: month, year: year)
    }
    
    func dateIndex(for indexPath: IndexPath) -> UICalendarViewDateIndex {
        let sectionsCount = indexPath.section + 1
        let year = sectionsCount / 12
        let month = indexPath.section % 12
        let day = indexPath.row + 1
        return UICalendarViewDateIndex(day: day, month: month, year: year)
    }
}

private extension UICalendarViewDataHelper {
    func fullYears(from monthCount: Int) -> Int {
        return monthCount / 12
    }
    
    func monthsInFinalYear(from monthCount: Int) -> Int {
        return monthCount % 12
    }
}

//extension UICalendarViewDataHelper {
//    func yesterday() -> UICalendarViewDay {
//        let previousIndex = previousDateIndex(from: currentlyLoadedDateIndex)
//        updateStoredIndices(to: previousIndex)
//        
//        return day(for: previousIndex)
//    }
//    
//    func tomorrow() -> UICalendarViewDay {
//        let nextIndex = nextDateIndex(from: currentlyLoadedDateIndex)
//        updateStoredIndices(to: nextIndex)
//        
//        return day(for: nextIndex)
//    }
//}
//
//private extension UICalendarViewDataHelper {
//    func previousDateIndex(from referenceDateIndex: UICalendarViewDateIndex) -> UICalendarViewDateIndex {
//        
//        // ensure we do not have any out of bounds day values
//        assert(referenceDateIndex.day > 0 && referenceDateIndex.day <= daysInCurrentMonth, "internal inconsistency - issue handling number of days in a month")
//        
//        // previous day on the first day of the month requires looking at the previous month
//        if referenceDateIndex.day == 1 {
//            
//            // ensure we do not have any out of bounds month values
//            assert(referenceDateIndex.month > 0 && referenceDateIndex.month <= 12, "internal inconsistency - issue handling number of days in a month")
//            
//            // previous day on the first day of the first month of the year requires looking at the previous year
//            // update days in current month
//            // decrement year value by one and set month value to 12 and set day value to number of days in current month
//            if referenceDateIndex.month == 1 {
//                let newYear = referenceDateIndex.year - 1
//                let newMonth = 12
//                let newDay = helper.days(month: newMonth, year: newYear)
//                
//                // a new month requires an update to the days in current month property
//                daysInCurrentMonth = newDay
//                
//                return UICalendarViewDateIndex(day: newDay, month: newMonth, year: newYear)
//                
//                // decrement month value by one and set day value to number of days in current month
//            } else if referenceDateIndex.month > 1, referenceDateIndex.month <= 12 {
//                let currentYear = referenceDateIndex.year
//                let newMonth = 12
//                let newDay = helper.days(month: newMonth, year: currentYear)
//                
//                // a new month requires an update to the days in current month property
//                daysInCurrentMonth = newDay
//                
//                return UICalendarViewDateIndex(day: newDay, month: newMonth, year: currentYear)
//                
//                // issue with handling number of months in year
//            } else {
//                assertionFailure("internal inconsistency - issue handling number of months in a year")
//                return .earliestDateIndex
//            }
//            
//            // decrement day value by one
//        } else if referenceDateIndex.day > 1, referenceDateIndex.day <= daysInCurrentMonth {
//            let currentYear = referenceDateIndex.year
//            let currentMonth = referenceDateIndex.month
//            let newDay = referenceDateIndex.day - 1
//            
//            return UICalendarViewDateIndex(day: newDay, month: currentMonth, year: currentYear)
//            
//            // issue with handling number of days in a month
//        } else {
//            assertionFailure("internal inconsistency - issue handling number of days in a month")
//            return .earliestDateIndex
//        }
//    }
//    
//    func nextDateIndex(from referenceDateIndex: UICalendarViewDateIndex) -> UICalendarViewDateIndex {
//        
//        // ensure we do not have any out of bounds day values
//        assert(referenceDateIndex.day > 0 && referenceDateIndex.day <= daysInCurrentMonth, "internal inconsistency - issue handling number of days in a month")
//        
//        // next day on the last day of the month requires looking at the next month
//        if referenceDateIndex.day == daysInCurrentMonth {
//            
//            // ensure we do not have any out of bounds month values
//            assert(referenceDateIndex.month > 0 && referenceDateIndex.month <= 12, "internal inconsistency - issue handling number of days in a month")
//            
//            // next day on the last day of the month requires looking at the next year
//            // increment year value by one and set month value to 1 and set day value to 1
//            if referenceDateIndex.month == 12 {
//                let newYear = referenceDateIndex.year + 1
//                let newMonth = 1
//                let newDay = 1
//                
//                // a new month requires an update to the days in current month property
//                daysInCurrentMonth = helper.days(month: newMonth, year: newYear)
//                
//                return UICalendarViewDateIndex(day: newDay, month: newMonth, year: newYear)
//                
//                // increment month value by one and set day value to 1
//            } else if referenceDateIndex.month > 0, referenceDateIndex.month < 12 {
//                let currentYear = referenceDateIndex.year
//                let newMonth = referenceDateIndex.month + 1
//                let newDay = 1
//                
//                // a new month requires an update to the days in current month property
//                daysInCurrentMonth = helper.days(month: newMonth, year: currentYear)
//                
//                return UICalendarViewDateIndex(day: newDay, month: newMonth, year: currentYear)
//                
//                // issue with handling number of months in year
//            } else {
//                assertionFailure("internal inconsistency - issue handling number of months in a year")
//                return .earliestDateIndex
//            }
//            
//            // increment day value by one
//        } else if referenceDateIndex.day > 0, referenceDateIndex.day < daysInCurrentMonth {
//            let currentYear = referenceDateIndex.year
//            let currentMonth = referenceDateIndex.month
//            let newDay = referenceDateIndex.day + 1
//            
//            return UICalendarViewDateIndex(day: newDay, month: currentMonth, year: currentYear)
//            
//            // issue with handling number of days in a month
//        } else {
//            assertionFailure("internal inconsistency - issue handling number of days in a month")
//            return .earliestDateIndex
//        }
//    }
//}
//
//private extension UICalendarViewDataHelper {
//    func day(for index: UICalendarViewDateIndex) -> UICalendarViewDay {
//        
//        // if the day index exists in the cache return that value
//        if let yearCache = data[index.year], let monthCache = yearCache[index.month], let dayCache = monthCache[index.day] {
//            return dayCache
//            
//            // if the cache is empty for that index
//            // construct the day and add it to the cache
//        } else {
//            let day = UICalendarViewDay(date: UICalendarViewDate(dateIndex: index, helper: helper))
//            cache(day)
//            return day
//        }
//    }
//}
//
//private extension UICalendarViewDataHelper {
//    func updateStoredIndices(to newIndex: UICalendarViewDateIndex) {
//        if newIndex < earilestLoadedDateIndex {
//            updateEarilestIndex(to: newIndex)
//            updateCurrentIndex(to: newIndex)
//        } else if newIndex > latestLoadedDateIndex {
//            updateLatestIndex(to: newIndex)
//            updateCurrentIndex(to: newIndex)
//        } else {
//            updateCurrentIndex(to: newIndex)
//        }
//    }
//    
//    func updateEarilestIndex(to newIndex: UICalendarViewDateIndex) {
//        guard newIndex < earilestLoadedDateIndex else {
//            assertionFailure("internal inconsistency - should not attempt to update earliest index with an older date")
//            return
//        }
//        
//        earilestLoadedDateIndex = newIndex
//    }
//    
//    func updateCurrentIndex(to newIndex: UICalendarViewDateIndex) {
//        currentlyLoadedDateIndex = newIndex
//    }
//    
//    func updateLatestIndex(to newIndex: UICalendarViewDateIndex) {
//        guard newIndex > latestLoadedDateIndex else {
//            assertionFailure("internal inconsistency - should not attempt to update latest index with an eariler date")
//            return
//        }
//        
//        latestLoadedDateIndex = newIndex
//    }
//    
//    func cache(_ day: UICalendarViewDay) {
//        
//        // if the year exists in the cache continue
//        // otherwise create the year in the data structure
//        guard data[day.date.indices.year] != nil else {
//            
//            // safe to force unwrap as we guard against the possibility of nil above
//            data[day.date.indices.year] = [day.date.indices.month: [day.date.indices.month: day]]
//            return
//        }
//        
//        // if the month exists in the cache continue
//        // otherwise create the month in the data structure
//        guard data[day.date.indices.year]?[day.date.indices.month] != nil else {
//            
//            // safe to force unwrap as we guard against the possibility of nil above
//            data[day.date.indices.year]![day.date.indices.month] = [day.date.indices.month: day]
//            return
//        }
//        
//        // safe to force unwrap as we guard against the possibility of nil above
//        data[day.date.indices.year]![day.date.indices.month]![day.date.indices.day] = day
//    }
//}
//
//extension UICalendarViewDataHelper {
//    func numberOfMonths() -> Int {
//        var accumulatedMonths: Int = 0
//        
//        data.forEach { yearCache in
//            accumulatedMonths += yearCache.value.count
//        }
//        
//        return accumulatedMonths
//    }
//    
//    func numberOfDays(in month: Int) -> Int {
//        let numberOfYears = month / 12
//        let numberOfMonthsRemaining = month % 12
//        let monthCount = earilestLoadedDateIndex.month + numberOfMonthsRemaining
//        let monthCountRemainder = monthCount % 12
//        
//        var year = earilestLoadedDateIndex.year + numberOfYears
//        var month = earilestLoadedDateIndex.month
//        
//        if monthCount > 12 {
//            year += 1
//            month = monthCountRemainder
//        } else {
//            month = monthCountRemainder
//        }
//        
//        guard
//            let yearCache = data[year],
//            let monthCache = yearCache[month]
//        else {
//            assertionFailure("internal inconsistency - trying to access number of days without having loaded them")
//            return 0
//        }
//        
//        return monthCache.count
//    }
//}
