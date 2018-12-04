//
//  UICalendarViewLayoutConfiguration.swift
//  Client
//
//  Created by Ampe on 11/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UICalendarViewLayoutConfiguration {
    let heightInPixelsOfOneHour: CGFloat
    
    init(heightInPixelsOfOneHour: CGFloat = 30) {
        self.heightInPixelsOfOneHour = heightInPixelsOfOneHour
    }
}

extension UICalendarViewLayoutConfiguration {
    static let `default` = UICalendarViewLayoutConfiguration()
}
