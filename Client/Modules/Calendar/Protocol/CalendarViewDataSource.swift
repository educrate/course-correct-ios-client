//
//  CalendarViewDataSource.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import Foundation

protocol CalendarViewDataSource {
    var calendar: Calendar { get }
    
    func day(for date: Date) -> CalendarDay?
}
