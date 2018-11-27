//
//  UICalendarViewBrain.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewBrain {
    let dataSource: UICalendarViewDataMapper
    let layoutCalculator: UICalendarViewLayoutCalculator
    
    init(configuration: UICalendarViewConfiguration = .default) {
        layoutCalculator = UICalendarViewLayoutCalculator(configuration.heightInPixelsOfOneHour)
        dataSource = UICalendarViewDataMapper(helper: UICalendarViewHelper(configuration.calendar),
                                              startDateIndex: configuration.startDateIndex)
    }
}

extension UICalendarViewBrain {
    static let `default` = UICalendarViewBrain()
}
