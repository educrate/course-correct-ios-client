//
//  UIActionViewConfiguration.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

struct UIActionViewConfiguration {
    let backgroundColor: UIColor
    let maxBackgroundAlphaValue: CGFloat
    let durationOfShowAnimation: TimeInterval
    let durationOfHideAnimation: TimeInterval
    let cellHeight: CGFloat
    
    init(backgroundColor: UIColor = .black,
         maxBackgroundAlphaValue: CGFloat = 0.5,
         durationOfShowAnimation: TimeInterval = 0.3,
         durationOfHideAnimation: TimeInterval = 0.1,
         cellHeight: CGFloat = 60) {
        
        self.backgroundColor = backgroundColor
        self.maxBackgroundAlphaValue = maxBackgroundAlphaValue
        self.durationOfShowAnimation = durationOfShowAnimation
        self.durationOfHideAnimation = durationOfHideAnimation
        self.cellHeight = cellHeight
    }
}

extension UIActionViewConfiguration {
    static let `default` = UIActionViewConfiguration()
}
