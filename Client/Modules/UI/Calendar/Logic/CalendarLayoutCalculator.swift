//
//  CalendarLayoutCalculator.swift
//  Client
//
//  Created by Christian Ampe on 9/30/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CalendarLayoutCalculator {
    private var heightOfOneHour: Int
    
    init(_ heightInPixelsOfOneHour: Int) {
        heightOfOneHour = heightInPixelsOfOneHour
    }
}

extension CalendarLayoutCalculator {
    func height(for timeInterval: TimeInterval,
                minimumHeight: CGFloat) -> CGFloat {
        
        let numberOfHours = timeInterval / TimeInterval.secondsInAnHour
        
        let height = CGFloat(heightOfOneHour) * CGFloat(numberOfHours)
        
        guard height > minimumHeight else {
            return minimumHeight
        }
        
        return height
    }
    
    func height(for numberOfMinutes: Int,
                minimumHeight: CGFloat) -> CGFloat {
        
        let numberOfHours = TimeInterval(numberOfMinutes) / TimeInterval.minutesInAnHour
        
        let height = CGFloat(Double(heightOfOneHour) * numberOfHours)
        
        guard height > minimumHeight else {
            return minimumHeight
        }
        
        return height
    }
}

extension TimeInterval {
    static let secondsInAnHour: TimeInterval = 3600
    static let minutesInAnHour: TimeInterval = 60
}
