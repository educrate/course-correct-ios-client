//
//  CalendarViewInteractor.swift
//  Client
//
//  Created by Ampe on 9/18/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

protocol CalendarViewInteractor {
    func dayCell(from day: CalendarDay) -> CalendarViewDayCell
}
