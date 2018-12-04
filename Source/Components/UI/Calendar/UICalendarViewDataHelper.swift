//
//  UICalendarViewDataHelper.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewDataHelper {
    private let dateHelper: UICalendarViewDateHelper
    private let cache: UICalendarViewDataHelperDictionary
    
    init(calendar: Calendar,
         cache: UICalendarViewDataHelperDictionary = UICalendarViewDataHelperDictionary()) {
        
        self.dateHelper = UICalendarViewDateHelper(calendar: calendar)
        self.cache = cache
    }
}

extension UICalendarViewDataHelper: UICalendarViewDateDataSource {
    func date(for indexPath: IndexPath) -> UICalendarViewDate {
        let comp = UICalendarViewDateComponents(day: 3, month: 12, year: 2018)
        let desc = dateHelper.dateDescription(from: comp)
        return UICalendarViewDate(components: comp, description: desc)
    }
}

extension UICalendarViewDataHelper {
    func months() -> Int {
        return 12
    }
    
    func days(in section: Int) -> Int {
        return 30
    }
}
