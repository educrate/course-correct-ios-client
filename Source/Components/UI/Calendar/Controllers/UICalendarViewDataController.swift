//
//  UICalendarViewDataController.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewDataController {
    private let helper: UICalendarViewHelper
    private let cache: UICalendarViewDataHelperDictionary
    
    init(calendar: Calendar,
         cache: UICalendarViewDataHelperDictionary = UICalendarViewDataHelperDictionary()) {
        
        self.helper = UICalendarViewHelper(calendar: calendar)
        self.cache = cache
    }
}

extension UICalendarViewDataController: UICalendarViewDateDataSource {
    func numberOfMonths() -> Int {
        return 12
    }
    
    func numberOfDays(in section: Int) -> Int {
        return 30
    }
    
    func date(for indexPath: IndexPath) -> UICalendarViewDate {
        let comp = UICalendarViewDateComponents(day: 3, month: 12, year: 2018)
        let desc = helper.dateDescription(from: comp)
        return UICalendarViewDate(components: comp, description: desc)
    }
}
