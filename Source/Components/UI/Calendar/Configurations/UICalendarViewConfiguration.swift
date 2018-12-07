//
//  UICalendarViewConfiguration.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

struct UICalendarViewConfiguration {
    let layoutConfiguration: UICalendarViewLayoutConfiguration
    let cellConfiguration: UICalendarViewDayCellConfguration
    
    init(layoutConfiguration: UICalendarViewLayoutConfiguration = .default,
         cellConfiguration: UICalendarViewDayCellConfguration = .default) {
        
        self.layoutConfiguration = layoutConfiguration
        self.cellConfiguration = cellConfiguration
    }
}

extension UICalendarViewConfiguration {
    static let `default` = UICalendarViewConfiguration()
}
