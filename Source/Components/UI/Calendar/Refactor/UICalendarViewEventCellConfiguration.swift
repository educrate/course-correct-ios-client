//
//  UICalendarViewEventCellConfiguration.swift
//  Client
//
//  Created by Ampe on 11/23/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UICalendarViewEventCellConfiguration {
    let defaultHeight: CGFloat
    let interitemSpacing: CGFloat
    let lineSpacing: CGFloat
    
    init(defaultHeight: CGFloat = 60,
         interitemSpacing: CGFloat = 8,
         lineSpacing: CGFloat = 8) {
        
        self.defaultHeight = defaultHeight
        self.interitemSpacing = interitemSpacing
        self.lineSpacing = lineSpacing
    }
}

extension UICalendarViewEventCellConfiguration {
    static let `default` = UICalendarViewEventCellConfiguration()
}
