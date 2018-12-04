//
//  UICalendarViewLayoutController.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarViewLayoutController {
    private let heightInPixelsOfOneHour: CGFloat
    
    init(heightInPixelsOfOneHour: CGFloat) {
        self.heightInPixelsOfOneHour = heightInPixelsOfOneHour
    }
}

extension UICalendarViewLayoutController: UICalendarViewLayoutDelegate {
    func heightForCell(_ eventCount: Int) -> CGFloat {
        return 50 * CGFloat(eventCount)
    }
}
