//
//  UICalendarViewLayoutCalculator.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarViewLayoutCalculator {
    private let heightOfOneHour: CGFloat
    
    init(_ heightInPixelsOfOneHour: CGFloat) {
        heightOfOneHour = heightInPixelsOfOneHour
    }
}

extension UICalendarViewLayoutCalculator {
    func height(for timeInterval: TimeInterval,
                minimumHeight: CGFloat) -> CGFloat {
        
        let numberOfHours = timeInterval / UICalendarViewDateHelper.secondsInAnHour
        let height = heightOfOneHour * CGFloat(numberOfHours)
        
        guard height > minimumHeight else {
            return minimumHeight
        }
        
        return height
    }
    
    func height(for numberOfMinutes: Int,
                minimumHeight: CGFloat) -> CGFloat {
        
        let numberOfHours = TimeInterval(numberOfMinutes) / UICalendarViewDateHelper.minutesInAnHour
        let height = CGFloat(Double(heightOfOneHour) * numberOfHours)
        
        guard height > minimumHeight else {
            return minimumHeight
        }
        
        return height
    }
}
