//
//  UICalendarViewBrain.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewBrain {
    let dataSource: UICalendarViewDataHelper
    let layoutCalculator: UICalendarViewLayoutCalculator
    
    init(configuration: UICalendarViewConfiguration = .default) {
        dataSource = UICalendarViewDataHelper(calendar: configuration.dataConfiguration.calendar)
        layoutCalculator = UICalendarViewLayoutCalculator(configuration.layoutConfiguration.heightInPixelsOfOneHour)
    }
}

extension UICalendarViewBrain {
    static let `default` = UICalendarViewBrain()
}
