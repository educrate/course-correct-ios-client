//
//  CalendarLayoutCalculator.swift
//  Client
//
//  Created by Ampe on 9/30/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

class CalendarLayoutCalculator {
    private var heightOfOneMinute: Int
    
    init(_ heightInPixelsOfOneMinute: Int) {
        heightOfOneMinute = heightInPixelsOfOneMinute
    }
}

extension CalendarLayoutCalculator {
    func height(for timeInterval: TimeInterval) -> CGFloat {
        return CGFloat(heightOfOneMinute * Int(timeInterval))
    }
    
    func height(for numberOfMinutes: Int) -> CGFloat {
        return CGFloat(heightOfOneMinute * numberOfMinutes)
    }
}
