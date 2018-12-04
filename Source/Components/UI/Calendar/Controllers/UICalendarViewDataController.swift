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
    
    func components(for indexPath: IndexPath) -> UICalendarViewDateComponents {
        return UICalendarViewDateComponents(day: 3, month: 12, year: 2018)
    }
    
    func descriptions(for components: UICalendarViewDateComponents) -> UICalendarViewDateDescription? {
        return helper.dateDescription(from: components)
    }
}
