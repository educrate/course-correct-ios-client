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
    private var minDateIndex: UICalendarViewDateIndex
    private var maxDateIndex: UICalendarViewDateIndex
    
    init(helper: UICalendarViewHelper,
         startDateIndex: UICalendarViewDateIndex) {
        
        self.helper = helper
        self.minDateIndex = startDateIndex
        self.maxDateIndex = startDateIndex
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
