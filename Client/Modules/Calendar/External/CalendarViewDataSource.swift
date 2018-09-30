//
//  CalendarViewDataSource.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import Foundation

protocol CalendarViewDataSource {
    func day(for date: CalendarDate) -> CalendarDay?
}
