//
//  UINotificationConfiguration.swift
//  Client
//
//  Created by Ampe on 10/27/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UINotificationViewConfiguration {
    let textColor: UIColor
    let textAlignment: NSTextAlignment
    let backgroundColor: UIColor
    let durationOfShowAnimation: TimeInterval
    let durationOfPersistence: TimeInterval
    let durationOfHideAnimation: TimeInterval
    
    init(textColor: UIColor = .white,
         textAlignment: NSTextAlignment = .center,
         backgroundColor: UIColor = .red,
         durationOfShowAnimation: TimeInterval = 0.2,
         durationOfPersistence: TimeInterval = 3,
         durationOfHideAnimation: TimeInterval = 0.1) {
        
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.durationOfShowAnimation = durationOfShowAnimation
        self.durationOfPersistence = durationOfPersistence
        self.durationOfHideAnimation = durationOfHideAnimation
    }
}

extension UINotificationViewConfiguration {
    static let `default` = UINotificationViewConfiguration()
}
