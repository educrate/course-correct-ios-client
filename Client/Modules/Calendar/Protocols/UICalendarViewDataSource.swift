//
//  CalendarViewDataSource.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import Foundation

protocol UICalendarViewDataSource {
    func day(for date: CalendarDate) -> CalendarDay?
}
