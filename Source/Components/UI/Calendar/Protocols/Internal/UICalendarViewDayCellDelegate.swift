//
//  UICalendarViewDayCellDelegate.swift
//  Client
//
//  Created by Ampe on 12/28/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol UICalendarViewDayCellDelegate: class {
    func calendarViewDayCell(_ calendarViewDayCell: UICalendarViewDayCell, didSelectEventAt indexPath: IndexPath, _ dayIndexPath: IndexPath)
}
