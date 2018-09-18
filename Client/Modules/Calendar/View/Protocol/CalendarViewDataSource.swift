//
//  CalendarViewDataSource.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import Foundation

public protocol CalendarViewDataSource: class {
    func calendarView(_ calendarView: CalendarView, cellForRowAt: IndexPath) -> CalendarViewDayCell
    func calendarView(_ calendarView: CalendarView, numberOfRowsInSection: Int) -> Int
    func numberOfSections(calendarView in: CalendarView) -> Int
}
