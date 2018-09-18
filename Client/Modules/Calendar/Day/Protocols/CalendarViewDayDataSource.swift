//
//  CalendarViewDayDataSource.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import Foundation

protocol CalendarViewDayDataSource: class {
    func calendarViewDayCell(_ calendarViewDayCell: CalendarViewDayCell, cellForRowAt: IndexPath) -> CalendarViewEventCell
    func calendarViewDayCell(_ calendarViewDayCell: CalendarViewDayCell, numberOfRowsInSection: Int) -> Int
}
