//
//  UICalendarViewDataHelper.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewDataHelper {
    let helper: UICalendarViewDateHelper
    private let earliestPossibleDateIndex: UICalendarViewDateComponents
    private let latestPossibleDateIndex: UICalendarViewDateComponents
    
    init(helper: UICalendarViewDateHelper,
         earliestPossibleDateIndex: UICalendarViewDateComponents,
         latestPossibleDateIndex: UICalendarViewDateComponents) {
        
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
        let monthCount = section + 1
        let years = fullYears(from: monthCount)
        let year = earliestPossibleDateIndex.year + years
        let months = monthsInFinalYear(from: monthCount)
        let month = (earliestPossibleDateIndex.month + months) - 1
        return helper.days(month: month, year: year)
    }
    
    func dateIndex(for indexPath: IndexPath) -> UICalendarViewDateComponents {
        let sectionsCount = indexPath.section + 1
        let year = (sectionsCount / 12) + earliestPossibleDateIndex.year
        let month = (indexPath.section % 12) + 1
        let day = (indexPath.row + 1)
        return UICalendarViewDateComponents(day: day, month: month, year: year)
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
