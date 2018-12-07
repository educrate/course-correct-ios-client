//
//  UICalendarViewEventCellConfiguration.swift
//  Client
//
//  Created by Christian Ampe on 11/23/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UICalendarViewEventCellConfiguration {
    let defaultHeight: CGFloat
    let interitemSpacing: CGFloat
    let lineSpacing: CGFloat
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let borderColor: UIColor
    
    init(defaultHeight: CGFloat = 60,
         interitemSpacing: CGFloat = 8,
         lineSpacing: CGFloat = 8,
         cornerRadius: CGFloat = 3,
         borderWidth: CGFloat = 1,
         borderColor: UIColor = .darkGray) {
        
        self.defaultHeight = defaultHeight
        self.interitemSpacing = interitemSpacing
        self.lineSpacing = lineSpacing
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
}

extension UICalendarViewEventCellConfiguration {
    static let `default` = UICalendarViewEventCellConfiguration()
}
