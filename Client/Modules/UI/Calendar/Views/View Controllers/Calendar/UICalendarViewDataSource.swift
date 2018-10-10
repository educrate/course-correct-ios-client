//
//  UICalendarViewDataSource.swift
//  Client
//
//  Created by Ampe on 10/2/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

protocol UICalendarViewDataSource {
    func day(for date: CalendarDate) -> CalendarDay?
}
