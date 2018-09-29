//
//  CalendarViewDataSource.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import Foundation

protocol CalendarViewDataSource {
    var calendar: Calendar { get }
    
    var minimumDay: CalendarDay { get set }
    var currentDay: CalendarDay { get set }
    var maximumDay: CalendarDay { get set }
    
    func day(for date: CalendarDate) -> CalendarDay?
}
