//
//  UICalendarViewDataController.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewDataController {
    private let earliestAvailableYear: Int = 2010
    private let latestAvailableYear: Int = 2019
    private let helper: UICalendarViewHelper
    private let cache: UICalendarViewDataHelperDictionary
    
    private var currentSection: Int = 0
    
    init(calendar: Calendar,
         cache: UICalendarViewDataHelperDictionary = UICalendarViewDataHelperDictionary()) {
        
        self.helper = UICalendarViewHelper(calendar: calendar)
        self.cache = cache
    }
}

extension UICalendarViewDataController: UICalendarViewDateDataSource {
    func numberOfMonths() -> Int {
        return months(from: earliestAvailableYear,
                      to: latestAvailableYear)
    }
    
    func numberOfDays(in section: Int) -> Int {
        guard section >= currentSection - 1 && section <= currentSection + 1 else {
            return 0
        }
        
        let components = monthComponents(section + 1)
        
        return helper.days(month: components.month,
                           year: components.year)
    }
    
    func components(for indexPath: IndexPath) -> UICalendarViewDateComponents {
        let components = monthComponents(indexPath.section + 1)
        return UICalendarViewDateComponents(day: indexPath.row + 1,
                                            month: components.month,
                                            year: components.year)
    }
    
    func descriptions(for components: UICalendarViewDateComponents) -> UICalendarViewDateDescription? {
        return helper.dateDescription(from: components)
    }
}

private extension UICalendarViewDataController {
    func months(from startYear: Int, to endYear: Int) -> Int {
        return (endYear - startYear + 1) * 12
    }
    
    func monthComponents(_ monthCount: Int) -> (year: Int, month: Int) {
        let extraYears = (monthCount - 1) / 12
        let year = earliestAvailableYear + extraYears
        let month = ((monthCount - 1) % 12) + 1
        
        return (year: year, month: month)
    }
}

extension UICalendarViewDataController: UICalendarViewDateDelegate {
    func willDisplay(_ indexPath: IndexPath) {
        currentSection = indexPath.section
    }
}
