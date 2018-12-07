//
//  UICalendarViewConfiguration.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewConfiguration {
    let cellConfiguration: UICalendarViewDayCellConfguration
    
    init(cellConfiguration: UICalendarViewDayCellConfguration = .default) {
        self.cellConfiguration = cellConfiguration
    }
}

extension UICalendarViewConfiguration {
    static let `default` = UICalendarViewConfiguration()
}
