//
//  CalendarViewCache.swift
//  Client
//
//  Created by Ampe on 9/26/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import Foundation

protocol CalendarViewCache {
    var minimumDay: CalendarDay { get set }
    var currentDay: CalendarDay { get set }
    var maximumDay: CalendarDay { get set }
    
    var days: Dictionary<CalendarDate, CalendarDay> { get set }
}
