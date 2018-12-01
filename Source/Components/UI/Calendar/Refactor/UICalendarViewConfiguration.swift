//
//  UICalendarViewConfiguration.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewConfiguration {
    let dataConfiguration: UICalendarViewDataConfiguration
    let layoutConfiguration: UICalendarViewLayoutConfiguration
    let cellConfiguration: UICalendarViewDayCellConfguration
    
    init(dataConfiguration: UICalendarViewDataConfiguration = .default,
         layoutConfiguration: UICalendarViewLayoutConfiguration = .default,
         cellConfiguration: UICalendarViewDayCellConfguration = .default) {
        
        self.dataConfiguration = dataConfiguration
        self.layoutConfiguration = layoutConfiguration
        self.cellConfiguration = cellConfiguration
    }
}

extension UICalendarViewConfiguration {
    static let `default` = UICalendarViewConfiguration()
}
