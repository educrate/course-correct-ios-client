//
//  UICalendarViewDataSource.swift
//  Client
//
//  Created by Christian Ampe on 10/2/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol UICalendarViewDataSource: class {
    func numberOfMonths(in calendarView: UICalendarView) -> Int
    func calendarView(_ calendarView: UICalendarView, numberOfDaysInSection section: Int) -> Int
    func calendarView(_ calendarView: UICalendarView, dayForItemAt indexPath: IndexPath) -> UICalendarViewDay
}
