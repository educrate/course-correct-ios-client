//
//  UICalendarViewDayCellConfguration.swift
//  Client
//
//  Created by Christian Ampe on 11/23/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UICalendarViewDayCellConfguration {
    let minimumHeight: CGFloat
    let interitemSpacing: CGFloat
    let lineSpacing: CGFloat
    let eventCellConfiguration: UICalendarViewEventCellConfiguration
    
    init(minimumHeight: CGFloat = 80,
         interitemSpacing: CGFloat = 8,
         lineSpacing: CGFloat = 8,
         eventCellConfiguration: UICalendarViewEventCellConfiguration = .default) {
        
        self.minimumHeight = minimumHeight
        self.interitemSpacing = interitemSpacing
        self.lineSpacing = lineSpacing
        self.eventCellConfiguration = eventCellConfiguration
    }
}

extension UICalendarViewDayCellConfguration {
    static let `default` = UICalendarViewDayCellConfguration()
}
