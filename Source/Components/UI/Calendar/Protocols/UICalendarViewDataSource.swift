//
//  UICalendarViewDataSource.swift
//  Client
//
//  Created by Christian Ampe on 10/2/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

/// External facing data source to provide the calendar
/// view with the necessary content to function.
protocol UICalendarViewDataSource: class {
    
    /// Asks your data source object for the number of months in the calendar view.
    ///
    /// - Parameter calendarView: The collection view requesting this information.
    /// - Returns: The number of months in calendarView.
    func numberOfMonths(in calendarView: UICalendarView) -> Int
    
    /// Asks your data source object for the number of days in the specified section.
    ///
    /// - Parameters:
    ///   - calendarView: The collection view requesting this information.
    ///   - section: An index number identifying a section in calendarView. This index value is 0-based.
    /// - Returns: The number of days in section.
    func calendarView(_ calendarView: UICalendarView, numberOfDaysInSection section: Int) -> Int
    
    /// Asks your data source object for the day that corresponds to the specified item in the calendarView.
    ///
    /// - Parameters:
    ///   - calendarView: The collection view requesting this information.
    ///   - indexPath: The index path that specifies the location of the item.
    /// - Returns: A fully formed day object. A day must be returned.
    func calendarView(_ calendarView: UICalendarView, dayForItemAt indexPath: IndexPath) -> UICalendarViewDay
}
